require 'spec_helper'

describe 'reports' do
  describe '#index' do
    before do
      create(:report)
      visit '/reports/'
    end

    it 'should reports' do
      expect(page).to have_content 'org_name2'
    end
  end

  describe "#show" do
    before do
      @report = create(:report)
      visit report_path(@report)
    end

    it 'should show a report' do
      expect(page).to have_content 'org_name3'
    end
  end
end
