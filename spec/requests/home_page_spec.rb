require 'spec_helper'

describe 'HomePage' do
  before(:each) do
    visit root_path
  end

  it 'shows the site title' do
    page.should have_content('Dmarc')
  end
end
