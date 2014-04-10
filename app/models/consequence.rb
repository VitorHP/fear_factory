class Consequence < ActiveRecord::Base
  belongs_to :consequential, polymorphic: true
  belongs_to :skill

  default_scope ->{ order(:level) }
end
