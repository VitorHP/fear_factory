class Extra < ActiveRecord::Base
  belongs_to :character

  default_scope ->{ order(:id) }
end
