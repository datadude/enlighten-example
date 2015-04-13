require 'rails_helper'

RSpec.describe SystemsController, :type => :controller do
  let(:system) {mock_system}
  before :each do
    allow(Enlighten::System).to receive(:new).with(any_args).and_return(system)
  end

  describe 'index action' do
    before :each do
      get :index
    end
    it "should render index template" do
      expect(response).to render_template(:index)
    end
    it "should assign @systems" do
      expect(assigns(:systems)).not_to be_nil
    end
    it "should assign @systems" do
      expect(assigns(:systems)[0]['system_name']).to eq("Eich Residence")
    end

    it "should return a 200" do
      expect(response.status).to eq(200)
    end

  end
  describe 'show action' do
    before :each do
      get :show, id: "67"
    end

    it "should render show template" do
      expect(response).to render_template(:show)
    end
    it "should assign @system" do
      expect(assigns(:system)).not_to be_nil
    end
    it "should assign @systems" do
      expect(assigns(:system).system_name).to eq("Eich Residence")
    end

    it "should return a 200" do
      expect(response.status).to eq(200)
    end


  end

  describe 'graph action' do
    before :each do
      get :graph, id: "67"
    end

    it "should render graph template" do
      expect(response).to render_template(:graph)
    end
    it "should assign @system" do
      expect(assigns(:system)).not_to be_nil
    end
    it "should assign @systems" do
      expect(assigns(:system).system_name).to eq("Eich Residence")
    end

    it "should return a 200" do
      expect(response.status).to eq(200)
    end

  end
end
