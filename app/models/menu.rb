class Menu < ApplicationRecord
  default_scope -> { order(order: :asc) }
end
