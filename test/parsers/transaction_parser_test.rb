require 'test_helper'

class TransactionParserTest < ActiveSupport::TestCase
  def setup
    example_input = File.open(Rails.root.join 'test', 'fixtures', 'example_input.tab')
    @transaction_parser = TransactionParser.new(example_input)
    @parsed_transactions ||= @transaction_parser.parse
  end

  def test_parse
    assert_equal @parsed_transactions.first[:purchaser_name], "Snake Plissken"
    assert_equal @parsed_transactions.first[:address], "987 Fake St"
  end

  def test_total
    assert_equal @transaction_parser.total, 30.0
  end
end
