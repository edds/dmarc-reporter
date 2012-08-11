class EmailController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    zip_content_type = /^application\/(x-)?zip/
    if message.content_type =~ zip_content_type
      file = message.body
    elsif message.attachments.first.content_type =~ zip_content_type
      file = message.attachments.first.body
    end

    if file
      dmarc = ParseDmarc.new(file)

      report = Report.create(dmarc.metadata)
      report.create_policy_published(dmarc.policy_published)
      dmarc.records.each do |row|
        report.records << Record.create(row)
      end
    end

    render text: 'success', status: 200
  end
end
