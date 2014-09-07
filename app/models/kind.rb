class Kind < ActiveRecord::Base
  belongs_to :platform, :polymorphic => true
end
