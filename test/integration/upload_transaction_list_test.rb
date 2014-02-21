require 'test_helper'

class UploadTransactionListTest < ActionDispatch::IntegrationTest
  test "uploading parses the CSV file, saves records and returns total" do
    visit new_upload_path
    attach_file "CSV File", Rails.root.join('test', 'fixtures', 'example_input.tab')
    click_button "Upload"
    assert page.has_text?("30.0 is the total amount gross revenue")
  end
end
