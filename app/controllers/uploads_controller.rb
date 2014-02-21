class UploadsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    transaction_parser = TransactionParser.new(params[:transaction][:list].tempfile)

    if Transaction.create(transaction_parser.parse)
      redirect_to new_upload_path,
        notice: "#{transaction_parser.total} is the total amount gross revenue for this file."
    else
      @transaction = Transaction.new
      render :new,
        notice: "Some error occurred while uploading the file."
    end
  end
end
