require 'test_helper'

class ProjectPeopleControllerTest < ActionController::TestCase
  setup do
    @project_person = project_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_person" do
    assert_difference('ProjectPerson.count') do
      post :create, project_person: @project_person.attributes
    end

    assert_redirected_to project_person_path(assigns(:project_person))
  end

  test "should show project_person" do
    get :show, id: @project_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_person
    assert_response :success
  end

  test "should update project_person" do
    put :update, id: @project_person, project_person: @project_person.attributes
    assert_redirected_to project_person_path(assigns(:project_person))
  end

  test "should destroy project_person" do
    assert_difference('ProjectPerson.count', -1) do
      delete :destroy, id: @project_person
    end

    assert_redirected_to project_people_path
  end
end
