class Consequence < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill

  default_scope ->{ order(:level) }
end
