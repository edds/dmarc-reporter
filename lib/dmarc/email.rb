require 'mail'
module Dmarc
  class Email
    def initialize(email)
      @doc = email
    end
    def report
      c = content
      return nil unless c
      Dmarc::Report.new(c)
    end
    private
    def content
      message = Mail.new(@doc)
      zip_content_type = /^application\/(x-)?zip/
      if message.content_type =~ zip_content_type
        message.body
      elsif message.attachments.any? and message.attachments.first.content_type =~ zip_content_type
        message.attachments.first.body
      end
    end
  end
end
