require "application_system_test_case"

class GratitudesTest < ApplicationSystemTestCase
  setup do
    @gratitude = gratitudes(:one)
  end

  test "visiting the index" do
    visit gratitudes_url
    assert_selector "h1", text: "My Gratitudes"
  end

  test "visiting the index shows gratitude entries" do
    visit gratitudes_url
    assert_text @gratitude.content
  end

  test "should create gratitude" do
    visit gratitudes_url
    click_on "New Gratitude"

    assert_selector "h1", text: "New Gratitude"

    fill_in "Content", with: "I am grateful for sunny weather"
    fill_in "Entry date", with: "2026-03-17"
    click_on "Create Gratitude"

    assert_text "Gratitude was successfully created"
    assert_text "I am grateful for sunny weather"
  end

  test "should not create gratitude without content" do
    visit new_gratitude_url

    fill_in "Content", with: ""
    click_on "Create Gratitude"

    assert_text "prohibited this gratitude from being saved"
    assert_text "Content can't be blank"
  end

  test "should update gratitude" do
    visit gratitude_url(@gratitude)
    click_on "Edit"

    fill_in "Content", with: "Updated gratitude content"
    click_on "Update Gratitude"

    assert_text "Gratitude was successfully updated"
    assert_text "Updated gratitude content"
  end

  test "should destroy gratitude" do
    visit gratitude_url(@gratitude)
    click_on "Delete"

    assert_text "Gratitude was successfully destroyed"
  end

  test "navigation between pages works" do
    visit gratitudes_url
    click_on "New Gratitude"
    assert_selector "h1", text: "New Gratitude"

    click_on "Back to gratitudes"
    assert_selector "h1", text: "My Gratitudes"
  end

  test "navbar links to home" do
    visit new_gratitude_url
    click_on "Gratitude Journal"
    assert_selector "h1", text: "My Gratitudes"
  end
end
