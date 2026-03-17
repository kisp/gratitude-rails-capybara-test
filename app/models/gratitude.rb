class Gratitude < ApplicationRecord
  validates :content, presence: true
  validates :entry_date, presence: true

  default_scope { order(entry_date: :desc, created_at: :desc) }

  after_initialize :set_default_entry_date, if: :new_record?

  private

  def set_default_entry_date
    self.entry_date ||= Date.today
  end
end
