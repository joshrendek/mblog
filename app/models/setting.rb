class Setting < ApplicationRecord
  def self.value(key, default="")
    find_by(name: key).try(:value) || default
  end
end
