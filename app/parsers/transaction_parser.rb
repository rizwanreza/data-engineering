require 'csv'

class TransactionParser
  attr_reader :uploaded_file
  attr_accessor :parsed

  def initialize(file)
    @uploaded_file = file
  end

  def parse
    self.parsed = CSV.parse uploaded_file, col_sep: "\t",
      headers: :first_row,
      return_headers: false

    build_transaction_attributes
  end

  def total
    records.map(&:third).map(&:to_f).sum
  end

  private

  def records
    parsed.to_a[1..-1]
  end

  def build_transaction_attributes
    records.inject([]) do |acc, row|
      acc << { purchaser_name: row[0],
               description: row[1],
               price: row[2],
               quantity: row[3],
               address: row[4],
               merchant_name: row[5] }
    end
  end
end
