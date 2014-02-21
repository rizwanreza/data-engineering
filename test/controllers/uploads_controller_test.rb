require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  test "new action responds with success" do
    get :new
    assert_response :success
  end

  test "new action assigns a new record" do
    get :new
    assert assigns(:transaction).new_record? 
  end

  test "create action redirects to new_upload_path if transaction is created" do
    file = fixture_file_upload('example_input.tab')
    file.stubs(:tempfile).returns(file)
    Transaction.any_instance.stubs(:create).returns(true)
    post :create, transaction: { list: file }
    assert_redirected_to new_upload_path
  end

  test "create action renders new template if transaction isn't created" do
    file = fixture_file_upload('transactions.yml') # test file
    file.stubs(:tempfile).returns(file)
    Transaction.stubs(:create).returns(false)
    post :create, transaction: { list: file }
    assert_response :success
  end
end
