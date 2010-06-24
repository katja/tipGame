class Login
  include ActiveModel::Naming
  include ActiveModel::Validations
  
  attr_accessor :name, :password
  
  def validate
    user = @name_or_mail.include?('@') ? User.authenticate_with_mail(@name_or_mail, password) : User.authenticate_with_name(@name_or_mail, password)
    errors.add :password, 'does not match name' if user.nil?
    self.password = nil
    user
  end
  
  def initialize(attributes = nil)
    if attributes
      @name_or_mail = attributes[:name]
      @password = attributes[:password]
    end
  end
end