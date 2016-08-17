class Company < ActiveRecord::Base

	validates :name, :website, :email, presence: true

	belongs_to :employee

end