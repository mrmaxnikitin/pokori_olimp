class Contest < ActiveRecord::Base
	has_many :tasks
	has_many :rewards
end
