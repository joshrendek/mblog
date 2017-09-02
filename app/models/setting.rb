class Setting < ApplicationRecord
  def self.value(key)
    find_by(name: key).value
  end
end
