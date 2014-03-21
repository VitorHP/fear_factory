class Aspect < ActiveRecord::Base
  belongs_to :aspectable, polymorphic: true

  default_scope ->{ order(:id) }
end
