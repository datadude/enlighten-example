require_relative '../rails_helper'

describe "Systems Index Page" do
  let(:system) {mock_system}
  before :each do
    allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
    visit '/systems'
  end

  it 'should list all of the systems a user has access to' do
    expect(page).to have_content('Windsor, CA, US')
  end
  it 'should have 8 panels' do
    expect(all('.panel').length).to eq 7
  end
  it 'should link to detail page' do
    expect(page).to have_selector('.panel a[href="/systems/show/67"]')
  end

end