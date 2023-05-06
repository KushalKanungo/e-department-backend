require "test_helper"

class TimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable = timetables(:one)
  end

  test "should get index" do
    get timetables_url, as: :json
    assert_response :success
  end

  test "should create timetable" do
    assert_difference("Timetable.count") do
      post timetables_url, params: { timetable: { active: @timetable.active, date: @timetable.date, description: @timetable.description, semester: @timetable.semester, title: @timetable.title, url: @timetable.url } }, as: :json
    end

    assert_response :created
  end

  test "should show timetable" do
    get timetable_url(@timetable), as: :json
    assert_response :success
  end

  test "should update timetable" do
    patch timetable_url(@timetable), params: { timetable: { active: @timetable.active, date: @timetable.date, description: @timetable.description, semester: @timetable.semester, title: @timetable.title, url: @timetable.url } }, as: :json
    assert_response :success
  end

  test "should destroy timetable" do
    assert_difference("Timetable.count", -1) do
      delete timetable_url(@timetable), as: :json
    end

    assert_response :no_content
  end
end
