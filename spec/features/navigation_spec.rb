require_relative '../rails_helper'
describe "Navbar" do
  let(:system) {mock_system}
  before :each do
    allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
  end
  describe "home page" do
    before :each do
      visit '/systems'
    end
    it "should have Application Title" do
      expect(page).to have_content 'Enphase Enlighten Data Browser'
    end
    it "should not link to home page" do
      expect(page).not_to have_selector('.systems__link')
    end
    it "should not have a link to the power graph" do
      expect(page).not_to have_selector('.systems_graph_link')
    end

    it "should not have a link to detail page" do
      expect(page).not_to have_selector('.systems_show_link')
    end
  end

  describe "on system detail page" do
    before :each do
      visit '/systems/show/67'
    end
    it "should link to home page" do
      expect(page).to have_selector('.systems__link')
    end
    it "should have a link to the power graph" do
      expect(page).to have_selector('.systems_graph_link')
    end

    it "should not have a link to detail page" do
      expect(page).not_to have_selector('.systems_show_link')
    end
  end
  describe "on power graph page" do
    before :each do
      visit '/systems/graph/67'
    end
    it "should link to home page" do
      expect(page).to have_selector('.systems__link')
    end
    it "should not have a link to the power graph" do
      expect(page).not_to have_selector('.systems_graph_link')
    end

    it "should have a link to detail page" do
      expect(page).to have_selector('.systems_show_link')
    end
  end

end