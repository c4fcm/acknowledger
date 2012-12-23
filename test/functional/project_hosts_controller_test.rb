require 'test_helper'

class ProjectHostsControllerTest < ActionController::TestCase
  setup do
    @project_host = project_hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_host" do
    assert_difference('ProjectHost.count') do
      post :create, project_host: @project_host.attributes
    end

    assert_redirected_to project_host_path(assigns(:project_host))
  end

  test "should show project_host" do
    get :show, id: @project_host
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_host
    assert_response :success
  end

  test "should update project_host" do
    put :update, id: @project_host, project_host: @project_host.attributes
    assert_redirected_to project_host_path(assigns(:project_host))
  end

  test "should destroy project_host" do
    assert_difference('ProjectHost.count', -1) do
      delete :destroy, id: @project_host
    end

    assert_redirected_to project_hosts_path
  end
end
