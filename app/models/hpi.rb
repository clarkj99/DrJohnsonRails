class Hpi < ApplicationRecord
  belongs_to :encounter

  enum duration_units = [:days, :weeks, :months]
  enum aggravating_factors = [:movement, :rest, :intercourse, :bowel_movement, :pressure, :touch, :urination]
end
