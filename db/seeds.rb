# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Team.create(:name => 'Südafrika', :group => 'A')
Team.create(:name => 'Mexiko', :group => 'A')
Team.create(:name => 'Uruguay', :group => 'A')
Team.create(:name => 'Frankreich', :group => 'A')

Team.create(:name => 'Argentinien', :group => 'B')
Team.create(:name => 'Nigeria', :group => 'B')
Team.create(:name => 'Südkorea', :group => 'B')
Team.create(:name => 'Griechenland', :group => 'B')

Team.create(:name => 'England', :group => 'C')
Team.create(:name => 'USA', :group => 'C')
Team.create(:name => 'Algerien', :group => 'C')
Team.create(:name => 'Slowenien', :group => 'C')

Team.create(:name => 'Deutschland', :group => 'D')
Team.create(:name => 'Australien', :group => 'D')
Team.create(:name => 'Serbien', :group => 'D')
Team.create(:name => 'Ghana', :group => 'D')

Team.create(:name => 'Niederlande', :group => 'E')
Team.create(:name => 'Dänemark', :group => 'E')
Team.create(:name => 'Japan', :group => 'E')
Team.create(:name => 'Kamerun', :group => 'E')

Team.create(:name => 'Italien', :group => 'F')
Team.create(:name => 'Paraguay', :group => 'F')
Team.create(:name => 'Neuseeland', :group => 'F')
Team.create(:name => 'Slowakei', :group => 'F')

Team.create(:name => 'Brasilien', :group => 'G')
Team.create(:name => 'Nordkorea', :group => 'G')
Team.create(:name => 'Elfenbeinküste', :group => 'G')
Team.create(:name => 'Portugal', :group => 'G')

Team.create(:name => 'Spanien', :group => 'H')
Team.create(:name => 'Schweiz', :group => 'H')
Team.create(:name => 'Honduras', :group => 'H')
Team.create(:name => 'Chile', :group => 'H')

Team.create(:name => 'Sieger Gruppe A', :group => 'A')
Team.create(:name => 'Zweiter Gruppe A', :group => 'A')

Team.create(:name => 'Sieger Gruppe B', :group => 'B')
Team.create(:name => 'Zweiter Gruppe B', :group => 'B')

Team.create(:name => 'Sieger Gruppe C', :group => 'C')
Team.create(:name => 'Zweiter Gruppe C', :group => 'C')

Team.create(:name => 'Sieger Gruppe D', :group => 'D')
Team.create(:name => 'Zweiter Gruppe D', :group => 'D')

Team.create(:name => 'Sieger Gruppe E', :group => 'E')
Team.create(:name => 'Zweiter Gruppe E', :group => 'E')

Team.create(:name => 'Sieger Gruppe F', :group => 'F')
Team.create(:name => 'Zweiter Gruppe F', :group => 'F')

Team.create(:name => 'Sieger Gruppe G', :group => 'G')
Team.create(:name => 'Zweiter Gruppe G', :group => 'G')

Team.create(:name => 'Sieger Gruppe H', :group => 'H')
Team.create(:name => 'Zweiter Gruppe H', :group => 'H')

Team.create(:name => 'Sieger Viertelfinale 1', :group => 'unklar')
Team.create(:name => 'Sieger Viertelfinale 2', :group => 'unklar')
Team.create(:name => 'Sieger Viertelfinale 3', :group => 'unklar')
Team.create(:name => 'Sieger Viertelfinale 4', :group => 'unklar')

Team.create(:name => 'Verlierer Halbfinale 1', :group => 'unklar')
Team.create(:name => 'Verlierer Halbfinale 2', :group => 'unklar')

Team.create(:name => 'Sieger Halbfinale 1', :group => 'unklar')
Team.create(:name => 'Sieger Halbfinale 2', :group => 'unklar')


# group A
Match.create(:team_1_id => 1, :team_2_id => 2, :starts_at => DateTime.new(y=2010, m=6, d=11, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 3, :team_2_id => 4, :starts_at => DateTime.new(y=2010, m=6, d=11, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 1, :team_2_id => 3, :starts_at => DateTime.new(y=2010, m=6, d=16, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 4, :team_2_id => 2, :starts_at => DateTime.new(y=2010, m=6, d=17, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 2, :team_2_id => 3, :starts_at => DateTime.new(y=2010, m=6, d=22, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 4, :team_2_id => 1, :starts_at => DateTime.new(y=2010, m=6, d=22, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group B
Match.create(:team_1_id => 7, :team_2_id => 8, :starts_at => DateTime.new(y=2010, m=6, d=12, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 5, :team_2_id => 6, :starts_at => DateTime.new(y=2010, m=6, d=12, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 5, :team_2_id => 7, :starts_at => DateTime.new(y=2010, m=6, d=17, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 8, :team_2_id => 6, :starts_at => DateTime.new(y=2010, m=6, d=17, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 6, :team_2_id => 7, :starts_at => DateTime.new(y=2010, m=6, d=22, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 8, :team_2_id => 5, :starts_at => DateTime.new(y=2010, m=6, d=22, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group C
Match.create(:team_1_id => 9, :team_2_id => 10, :starts_at => DateTime.new(y=2010, m=6, d=12, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 11, :team_2_id => 12, :starts_at => DateTime.new(y=2010, m=6, d=13, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 12, :team_2_id => 10, :starts_at => DateTime.new(y=2010, m=6, d=18, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 9, :team_2_id => 11, :starts_at => DateTime.new(y=2010, m=6, d=18, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 10, :team_2_id => 11, :starts_at => DateTime.new(y=2010, m=6, d=23, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 12, :team_2_id => 9, :starts_at => DateTime.new(y=2010, m=6, d=23, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group D
Match.create(:team_1_id => 15, :team_2_id => 16, :starts_at => DateTime.new(y=2010, m=6, d=13, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 13, :team_2_id => 14, :starts_at => DateTime.new(y=2010, m=6, d=13, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 13, :team_2_id => 15, :starts_at => DateTime.new(y=2010, m=6, d=18, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 18, :team_2_id => 16, :starts_at => DateTime.new(y=2010, m=6, d=19, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 14, :team_2_id => 15, :starts_at => DateTime.new(y=2010, m=6, d=23, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 16, :team_2_id => 13, :starts_at => DateTime.new(y=2010, m=6, d=23, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group E
Match.create(:team_1_id => 17, :team_2_id => 18, :starts_at => DateTime.new(y=2010, m=6, d=14, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 19, :team_2_id => 20, :starts_at => DateTime.new(y=2010, m=6, d=14, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 17, :team_2_id => 19, :starts_at => DateTime.new(y=2010, m=6, d=19, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 20, :team_2_id => 18, :starts_at => DateTime.new(y=2010, m=6, d=19, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 18, :team_2_id => 19, :starts_at => DateTime.new(y=2010, m=6, d=24, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 20, :team_2_id => 17, :starts_at => DateTime.new(y=2010, m=6, d=24, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group F
Match.create(:team_1_id => 21, :team_2_id => 22, :starts_at => DateTime.new(y=2010, m=6, d=14, h=20, min=20, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 23, :team_2_id => 24, :starts_at => DateTime.new(y=2010, m=6, d=15, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 24, :team_2_id => 22, :starts_at => DateTime.new(y=2010, m=6, d=20, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 21, :team_2_id => 23, :starts_at => DateTime.new(y=2010, m=6, d=20, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 22, :team_2_id => 23, :starts_at => DateTime.new(y=2010, m=6, d=24, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 24, :team_2_id => 21, :starts_at => DateTime.new(y=2010, m=6, d=24, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group G
Match.create(:team_1_id => 27, :team_2_id => 28, :starts_at => DateTime.new(y=2010, m=6, d=15, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 25, :team_2_id => 26, :starts_at => DateTime.new(y=2010, m=6, d=15, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 25, :team_2_id => 27, :starts_at => DateTime.new(y=2010, m=6, d=20, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 28, :team_2_id => 26, :starts_at => DateTime.new(y=2010, m=6, d=21, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 26, :team_2_id => 27, :starts_at => DateTime.new(y=2010, m=6, d=25, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 28, :team_2_id => 25, :starts_at => DateTime.new(y=2010, m=6, d=25, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')

# group H
Match.create(:team_1_id => 31, :team_2_id => 32, :starts_at => DateTime.new(y=2010, m=6, d=16, h=13, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 29, :team_2_id => 30, :starts_at => DateTime.new(y=2010, m=6, d=16, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 32, :team_2_id => 30, :starts_at => DateTime.new(y=2010, m=6, d=21, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 29, :team_2_id => 31, :starts_at => DateTime.new(y=2010, m=6, d=21, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 30, :team_2_id => 31, :starts_at => DateTime.new(y=2010, m=6, d=25, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')
Match.create(:team_1_id => 32, :team_2_id => 29, :starts_at => DateTime.new(y=2010, m=6, d=25, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Preliminary')


# Achtelfinale
Match.create(:team_1_id => 33, :team_2_id => 36, :starts_at => DateTime.new(y=2010, m=6, d=26, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 37, :team_2_id => 40, :starts_at => DateTime.new(y=2010, m=6, d=26, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 39, :team_2_id => 38, :starts_at => DateTime.new(y=2010, m=6, d=27, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 35, :team_2_id => 34, :starts_at => DateTime.new(y=2010, m=6, d=27, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')

Match.create(:team_1_id => 41, :team_2_id => 44, :starts_at => DateTime.new(y=2010, m=6, d=28, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 45, :team_2_id => 48, :starts_at => DateTime.new(y=2010, m=6, d=28, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 43, :team_2_id => 42, :starts_at => DateTime.new(y=2010, m=6, d=29, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 47, :team_2_id => 46, :starts_at => DateTime.new(y=2010, m=6, d=29, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')

# Viertelfinale
Match.create(:team_1_id => 49, :team_2_id => 50, :starts_at => DateTime.new(y=2010, m=7, d=2, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 53, :team_2_id => 54, :starts_at => DateTime.new(y=2010, m=7, d=2, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 52, :team_2_id => 51, :starts_at => DateTime.new(y=2010, m=7, d=3, h=16, min=0, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 55, :team_2_id => 56, :starts_at => DateTime.new(y=2010, m=7, d=3, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')

# Halbfinale
Match.create(:team_1_id => 57, :team_2_id => 58, :starts_at => DateTime.new(y=2010, m=7, d=6, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
Match.create(:team_1_id => 59, :team_2_id => 60, :starts_at => DateTime.new(y=2010, m=7, d=7, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')

# Spiel um Platz Drei
Match.create(:team_1_id => 61, :team_2_id => 62, :starts_at => DateTime.new(y=2010, m=7, d=10, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')

# Finale
Match.create(:team_1_id => 63, :team_2_id => 64, :starts_at => DateTime.new(y=2010, m=7, d=11, h=20, min=30, s=0, of=(2.0/24.0)), :round => 'Vorrunde', :type => 'Final')
