require 'test_helper'

class TransactionsListTest < ActionDispatch::IntegrationTest
  setup do
    visit new_upload_path
    attach_file "CSV File", Rails.root.join('test', 'fixtures', 'example_input.tab')
    click_button "Upload"
  end

  test "uploading the transaction file persists them in the DB" do
    visit transactions_path
    assert page.has_text?("Snake Plissken")
    assert page.has_text?("Amy Pond")
    assert page.has_text?("5.0")
  end
end
