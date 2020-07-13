class CreateItem < ActiveRecord::Base

    validates :name, presence: true
end
