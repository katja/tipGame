require "digest/sha1"

class User < ActiveRecord::Base
  has_many :tips, :dependent => :destroy
  accepts_nested_attributes_for :tips, :reject_if => lambda { |a| a[:score] == ':' }
  
  before_save :encrypt_password, :if => :password_available?
  after_save :flush_password
  
  attr_accessor :password, :password_confirmation
  attr_accessible :password, :password_confirmation, :name, :mail, :tips_attributes
  
  validates_presence_of :name, :mail
  validates_presence_of :password, :password_confirmation, :if => :password_is_being_updated?
  validates_confirmation_of :password
  validates_uniqueness_of :name, :mail
  validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def self.authenticate(name, password)
    user = User.where(:name => name).first
    if user && user.encrypted_password == Digest::SHA1.hexdigest(password + user.salt)
      user
    else
      nil
    end
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.password_reset_instructions(self).deliver
  end
  
  def self.find_using_perishable_token(token, age = 10 * 60)
    return if token.blank?
    age = age.to_i
    
    conditions_sql = "perishable_token = ?"
    conditions_subs = [token]
    
    if column_names.include?("updated_at") && age > 0
      conditions_sql += " and updated_at > ?"
      conditions_subs << age.seconds.ago
    end
    find(:first, :conditions => [conditions_sql, *conditions_subs])
  end
  
  # richtiger Gewinner => 1 Punkt
  # richtige Tordifferenz => 2 Punkte
  # richtiger Tipp => 4 Punkte
  def points
    points = 0
    Match.where('goals_team_1 IS NOT NULL AND starts_at < ?', Time.now).each do |match|
      tip = Tip.where(:match_id => match.id).first
      if tip
        points += User.points(tip, match)
      end
    end
    points
  end
  
  def self.points(tip, match)
    calc_points(tip, match) if tip && tip.has_goals? && match.has_goals?
  end
  
  def self.calc_points(tip, match)
    real_diff = match.goals_team_1 - match.goals_team_2
    tip_diff = tip.goals_team_1 - tip.goals_team_2
    points = 0
    points += 1 if real_diff == tip_diff
    points += 1 if real_diff * tip_diff > 0
    points += 2 if real_diff == tip_diff && match.goals_team_1 == tip.goals_team_1
    points
  end

private
  def encrypt_password
    self.salt = (1..10).to_a.collect{ ('a'..'z').to_a.rand }.join
    self.encrypted_password = Digest::SHA1.hexdigest(self.password + self.salt)
  end
  
  def password_available?
    not password.blank?
  end
  
  def flush_password
    self.password = self.password_confirmation = nil
  end
  
  def password_is_being_updated?
    new_record? or not password.blank?
  end
  
  def reset_perishable_token!
    self.perishable_token = generate_token(15)
    self.save!
  end
  
  def generate_token(length)
    Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..length]
  end  
end
