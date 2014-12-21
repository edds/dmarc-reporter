class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    dmarc = Dmarc::Email.new(params[:message]).report
    return unless dmarc

    Record.save_dmarc(dmarc)

    render text: 'success', status: 200
  end
end
