class Stunt < ActiveRecord::Base
  belongs_to :stuntable, polymorphic: true

  default_scope ->{ order(:id) }
end
