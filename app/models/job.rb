class Job < ApplicationRecord
  validates :title, presence: true

  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  scope :published, -> { where(is_hidden: false) }
  scope :random5, -> { limit(5).order("RANDOM()") }
  scope :recent, -> { order('created_at DESC') }

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  class Job < ApplicationRecord
  has_many :resumes
end
end
