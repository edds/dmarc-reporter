class EmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    Rails.logger.log message.subject #print the subject to the logs
    Rails.logger.log message.body.decoded #print the decoded body to the logs
    Rails.logger.log message.attachments.first.inspect #
    

    render text: 'success', status: 200
  end
end
