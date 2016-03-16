class Team < ActiveRecord::Base
	has_many :users
	has_many :problems, ->{ order("updated_at DESC") }
end
