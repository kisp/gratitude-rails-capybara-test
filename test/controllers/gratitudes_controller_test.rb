require "test_helper"

class GratitudesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gratitude = gratitudes(:one)
  end

  test "should get index" do
    get gratitudes_url
    assert_response :success
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_gratitude_url
    assert_response :success
  end

  test "should create gratitude" do
    assert_difference("Gratitude.count") do
      post gratitudes_url, params: { gratitude: { content: "Test gratitude", entry_date: Date.today } }
    end

    assert_redirected_to gratitude_url(Gratitude.unscoped.last)
  end

  test "should not create gratitude without content" do
    assert_no_difference("Gratitude.count") do
      post gratitudes_url, params: { gratitude: { content: "", entry_date: Date.today } }
    end

    assert_response :unprocessable_entity
  end

  test "should show gratitude" do
    get gratitude_url(@gratitude)
    assert_response :success
  end

  test "should get edit" do
    get edit_gratitude_url(@gratitude)
    assert_response :success
  end

  test "should update gratitude" do
    patch gratitude_url(@gratitude), params: { gratitude: { content: "Updated content", entry_date: @gratitude.entry_date } }
    assert_redirected_to gratitude_url(@gratitude)
  end

  test "should not update gratitude without content" do
    patch gratitude_url(@gratitude), params: { gratitude: { content: "", entry_date: @gratitude.entry_date } }
    assert_response :unprocessable_entity
  end

  test "should destroy gratitude" do
    assert_difference("Gratitude.count", -1) do
      delete gratitude_url(@gratitude)
    end

    assert_redirected_to gratitudes_url
  end
end
