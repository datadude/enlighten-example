require_relative '../rails_helper'


describe "Power Graph" do
  let(:system) {mock_system}
  before :each do
    allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
    visit '/systems/graph/67'
  end

  describe "overview panel" do
    let(:panel){find('#overview.panel')}
    it "should have a overview panel" do
      expect(panel).not_to be_nil
    end
    it "shoud display the system name" do
      expect(panel).to have_content('Power Chart For: Eich Residence')
    end
    it "should display the system time zone" do
      expect(panel).to have_content('Postal Code 95472')
    end
  end

  describe "chart" do
    it 'should have a chart' do
      expect(find("#chart-1")).not_to be_nil
    end
  end



end