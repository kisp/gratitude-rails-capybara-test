require "test_helper"

class GratitudeTest < ActiveSupport::TestCase
  test "valid gratitude" do
    gratitude = Gratitude.new(content: "I am grateful for my health", entry_date: Date.today)
    assert gratitude.valid?
  end

  test "invalid without content" do
    gratitude = Gratitude.new(content: nil, entry_date: Date.today)
    assert_not gratitude.valid?
    assert_includes gratitude.errors[:content], "can't be blank"
  end

  test "invalid without entry_date" do
    gratitude = Gratitude.new(content: "Something")
    gratitude.entry_date = nil
    assert_not gratitude.valid?
    assert_includes gratitude.errors[:entry_date], "can't be blank"
  end

  test "default entry_date is today" do
    gratitude = Gratitude.new
    assert_equal Date.today, gratitude.entry_date
  end

  test "default scope orders by entry_date descending" do
    older = Gratitude.create!(content: "Older entry", entry_date: 2.days.ago)
    newer = Gratitude.create!(content: "Newer entry", entry_date: Date.today)
    assert_equal newer, Gratitude.first
  end

  test "same entry_date ordered by created_at descending" do
    first_created = Gratitude.create!(content: "First created", entry_date: Date.today)
    second_created = Gratitude.create!(content: "Second created", entry_date: Date.today)
    assert_equal second_created, Gratitude.first
  end
end
