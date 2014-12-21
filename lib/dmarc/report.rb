require 'zip'

module Dmarc
  class Report
    def initialize(file)
      @doc = Nokogiri::XML.parse(unzip(file))
    end

    def unzip(file)
      xml = ""
      tempfile = Tempfile.new('dmarc')
      tempfile.binmode
      begin
        tempfile.write(file)
        tempfile.flush
        Zip::File.foreach(tempfile.path) do |zip_entry|
          zip_entry.get_input_stream {|io| xml << io.read }
        end
      ensure
        if tempfile
          tempfile.close
          tempfile.unlink
        end
      end
      xml
    end

    def metadata
      data = @doc.at_xpath('//report_metadata')
      metadata = {}
      [ :org_name, :email, :extra_contact_info, :report_id ].each do |attr|
        metadata[attr] = data.at_xpath("#{attr}/text()").to_s
      end
      metadata[:begin] = DateTime.strptime(data.at_xpath("date_range/begin/text()").to_s, "%s")
      metadata[:end] = DateTime.strptime(data.at_xpath("date_range/end/text()").to_s, "%s")

      return metadata
    end

    def policy_published
      data = @doc.at_xpath('//policy_published')
      policy_published = {}
      [ :domain, :adkim, :aspf, :p, :pct].each do |attr|
        policy_published[attr] = data.at_xpath("#{attr}/text()").to_s
      end

      return policy_published
    end

    def records
      attrs = {
        source_ip: "row/source_ip",
        count: "row/count",
        disposition: "row/policy_evaluated/disposition",
        dkim: "row/policy_evaluated/dkim",
        spf: "row/policy_evaluated/spf",
        reason_type: "row/policy_evaluated/reason/type",
        comment: "row/policy_evaluated/reason/comment",
        header_from: "identifiers/header_from",
        dkim_domain: "auth_results/dkim/domain",
        dkim_result: "auth_results/dkim/result",
        dkim_hresult: "auth_results/dkim/human_result",
        spf_domain: "auth_results/spf/domain",
        spf_result: "auth_results/spf/result"
      }

      @doc.xpath('//record').map do |record|
        record_attrs = {}
        attrs.map do |attr, path|
          record_attrs[attr] = record.at_xpath("#{path}/text()").to_s
        end
        record_attrs
      end
    end
  end
end
