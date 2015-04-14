require_relative '../rails_helper'


describe "System Detail" do
  let(:system) {mock_system}
  before :each do
    allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
    visit '/systems/show/67'
  end
  describe "overview panel" do
    it "should have a overview panel" do
      expect(find('#overview.panel')).not_to be_nil
    end
    it "shoud display the system name" do
      expect(find('#overview.panel')).to have_content('Data For: Eich Residence')
    end
    it "should display the system time zone" do
      expect(find('#overview.panel')).to have_content('Time Zone America/Los_Angeles')
    end

  end
  describe "Envoys panel" do
    let(:panel){find('#envoys.panel')}

    it "should have an envoys panel" do
      expect(panel).not_to be_nil
    end

    it "should have a serial number" do
      expect(panel).to have_content 'serial_number 121112607295'
    end

  end

  describe "Production panel" do
    let(:panel){find('#production.panel')}

    it "should have an envoys panel" do
      expect(panel).not_to be_nil
    end

    it "should have a serial number" do
      expect(panel).to have_content 'start_date 2015-03-01'
    end

  end

  describe "inventory panel" do
    let(:panel){find('#inventory.panel')}

    it "should have an envoys panel" do
      expect(panel).not_to be_nil
    end

    it "should have a serial number" do
      expect(panel).to have_content 'sn 121112607295'
    end

    it "should have 36 table rows" do
      expect(panel.find('table').all('tr').count).to eq 36
    end
    it "should have serial numbers of inverters" do
      expect(panel.find('table')).to have_content '030909022461	M190'
    end
  end

  describe "stats panel" do
    let(:panel){find('#stats.panel')}
    it "should have a stats panel" do
      expect(panel).not_to be_nil
    end
    it "should list the number of devices" do
      expect(panel).to have_content 'total_devices 35'
    end
    it "should have a table header" do
      expect(panel).to have_content "intervals\nend_at	devices_reporting	powr	enwh"
    end
    it "should have 36 table rows" do
      expect(panel.find('table').all('tr').count).to eq 117
    end
  end

  describe "stats panel without intervals" do
    let(:system) {mock_system_empty_stats}
    before :each do
      allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
      visit '/systems/show/283776'
    end
    let(:panel){find('#stats.panel')}
    it "should have a stats panel" do
      expect(panel).not_to be_nil
    end

    it "should display an error message" do
      expect(panel).to have_content "Today's stats: Stats are not available for Eich Residence"
    end
  end
  describe "error on inventory panel" do
    let(:system) {mock_system_empty_stats}
    before :each do
      allow(system).to receive(:inventory).and_raise(Enlighten::EnlightenApiError.new(OpenStruct.new(JSON.parse(load_fixture(:error_500)))))
      allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
      visit '/systems/show/283776'
    end
    let(:panel){find('#inventory.panel')}
    it "should have a stats panel" do
      expect(panel).not_to be_nil
    end

    it "should display an error message" do
      expect(panel).to have_content "Inventory: No inventory is available for Eich Residence"
    end
  end

end