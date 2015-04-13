require_relative 'rails_helper'
describe EnlightenMocks do

  describe 'mock_system' do
    let(:system) {mock_system}

    describe 'attributes' do
      it "should set a system_id" do
        expect(system.system_id).to eq 67
      end
      it "should set a system_name" do
        expect(system.system_name).to eq "Eich Residence"
      end
      it "should set a system_public_name" do
        expect(system.system_public_name).to eq "Eich Residence"
      end
      it "should set a status" do
        expect(system.status).to eq "normal"
      end
      it "should set a timezone" do
        expect(system.timezone).to eq "America/Los_Angeles"
      end
      it "should set a country" do
        expect(system.country).to eq "US"
      end
      it "should set a state" do
        expect(system.state).to eq "CA"
      end
      it "should set a city" do
        expect(system.city).to eq "Sebastopol"
      end
      it "should set a connection_type" do
        expect(system.connection_type).to eq "ethernet"
      end
      it "should set other_references" do
        expect(system.other_references).to eq ["Solarfox"]
      end
      it "should set a postal_code" do
        expect(system.postal_code).to eq "95472"
      end
    end

    describe 'REST end points' do
      it "should return a system summary upon creation" do
        expect(system.summary.system_id).to eq 67
      end

      it "should return system stats upon request" do
        expect(system.stats.total_devices).to eq  35
      end

      it "should return system inventory upon request" do
        expect(system.inventory.envoys[0]['sn']).to eq "121112607295"
      end

      it "should return energy_lifetime upon request" do
        expect(system.energy_lifetime.start_date).to eq "2010-01-01"
      end

      it "should return cached energy_lifetime upon request" do
        expect(system.energy_lifetime.start_date).to eq "2010-01-01"
      end


      it "should return a date range for enery lifetime." do
          start_date = DateTime.parse("2010-01-01")
          end_date = DateTime.parse("2010-12-31")
          expect(system.energy_lifetime(start_date: start_date, end_date: end_date).start_date).to eq "2010-01-01"
        end
      end

      it "should return a date range for enery lifetime if passed strings." do
        expect(system.energy_lifetime(start_date: "2010-01-01", end_date: "2010-12-31").start_date).to eq "2010-01-01"
      end

  end


end
