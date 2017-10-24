class Discount < ApplicationRecord
  include Fae::BaseModelConcern

  validates :title, uniqueness: true, presence: true
  validates :value, presence: true
  enum discount: { Percent: 0, Cash: 1}

  def fae_display_field
    title
  end


end
