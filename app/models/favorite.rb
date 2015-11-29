class Favorite < ActiveRecord::Base

  belongs_to :favable, :polymorphic => true

  default_scope { where(oreder: 'created_at ASC')  }

  belongs_to :user
end
