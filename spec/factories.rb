FactoryGirl.define do
  factory :report do
    sequence(:org_name) { |n| "org_name#{n}" }
    sequence(:email) {|n| "email#{n}@example.com" }
    sequence(:extra_contact_info) {|n| "info #{n}" }
    sequence(:report_id) {|n| n.to_s }
    sequence(:begin) { |n| Time.zone.parse('2014-01-01 00:00:00') + n.day }
    sequence(:end) { |n| Time.zone.parse('2014-01-01 00:00:00') + 10 + n.day }
    sequence(:failed_count) {|n| n}
    sequence(:passed_count) {|n| n}
    sequence(:records) {|n| [FactoryGirl.build(:record)]}
    policy_published
  end

  factory :policy_published do
    sequence(:domain) { |n| "domain#{n}.com" }
    adkim "r"
    aspf "r"
    p "none"
    pct "100"
  end

  factory :record do
    sequence(:source_ip) { |n| "192.168.2.#{n}" }
    sequence(:dkim) { |n| "dkim #{n}" }
    sequence(:count) { |n| 0 }
    sequence(:disposition) { |n| "disposition #{n}" }
    sequence(:spf) { |n| "spf #{n}" }
    sequence(:reason_type) { |n| "reason_type #{n}" }
    sequence(:comment) { |n| "comment #{n}" }
    sequence(:header_from) { |n| "header_from #{n}" }
    sequence(:dkim_domain) { |n| "domain#{n}.org" }
    dkim_result "failed"
    dkim_hresult "Failed !"
    sequence(:spf_domain) { |n| "domain#{n}.org" }
    spf_result "failed"
  end
end
