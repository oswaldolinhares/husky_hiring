# frozen_string_literal: true

class Game < ApplicationRecord
  has_one_attached :file
  has_many :matches, dependent: :destroy
end
