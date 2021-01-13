require "test_helper"

class NominationListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nomination_list = nomination_lists(:one)
  end

  test "should get index" do
    get nomination_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_nomination_list_url
    assert_response :success
  end

  test "should create nomination_list" do
    assert_difference('NominationList.count') do
      post nomination_lists_url, params: { nomination_list: { token: @nomination_list.token } }
    end

    assert_redirected_to nomination_list_url(NominationList.last)
  end

  test "should show nomination_list" do
    get nomination_list_url(@nomination_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_nomination_list_url(@nomination_list)
    assert_response :success
  end

  test "should update nomination_list" do
    patch nomination_list_url(@nomination_list), params: { nomination_list: { token: @nomination_list.token } }
    assert_redirected_to nomination_list_url(@nomination_list)
  end

  test "should destroy nomination_list" do
    assert_difference('NominationList.count', -1) do
      delete nomination_list_url(@nomination_list)
    end

    assert_redirected_to nomination_lists_url
  end
end
