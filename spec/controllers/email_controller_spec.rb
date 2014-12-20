require 'spec_helper'

describe EmailController do
  before do
    post :create, message: File.read(fixture_path_for("email.iml"))
  end
  it "should work" do
    expect(Report.count).to eq(1)
    @report = Report.first
    expected_report = {
      org_name: "google.com",
      email: "noreply-dmarc-support@google.com",
      extra_contact_info: "http://support.google.com/a/bin/answer.py?answer=2466580",
      report_id: "5367839200730979585",
      begin: Time.parse("Fri, 19 Dec 2014 00:00:00 UTC +00:00"),
      end: Time.parse("Fri, 19 Dec 2014 23:59:59 UTC +00:00"),
      failed_count: 0,
      passed_count: 104
    }
    expected_report.each do |k,v|
      expect(@report[k]).to eq(v)
    end

    expected_records = {
      id: 1,
      report_id: 1,
      source_ip: "2607:f8b0:4001:c03::22d",
      dkim: "fail",
      count: 1,
      disposition: "none",
      spf: "fail",
      reason_type: "",
      comment: "",
      header_from: "higgsboson.tk",
      dkim_domain: "",
      dkim_result: "fail",
      dkim_hresult: "",
      spf_domain: "devireddy.com",
      spf_result: "neutral",
    }
    expect(@report.records.count).to eq(21)
    first_record = @report.records.first
    expected_records.each do |k,v|
      expect(first_record[k]).to eq(v)
    end

    expected_policy = {
      domain: "higgsboson.tk",
      adkim: "r",
      aspf: "r",
      p: "none",
      pct: "100",
    }

    expect(PolicyPublished.count).to eq(1)
    @policy = PolicyPublished.first
    expected_policy.each do |k,v|
      expect(@policy[k]).to eq(v)
    end
  end
end
