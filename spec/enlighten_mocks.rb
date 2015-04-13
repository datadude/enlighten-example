module EnlightenMocks

  FIXTURE_DIR = File.expand_path('../fixtures', __FILE__).freeze

def mock_system
  system = double('Enlighten::System')
  Enlighten::System::END_POINTS.each do |endpoint|
    allow(system).to receive(endpoint).and_return OpenStruct.new(JSON.parse(load_fixture(endpoint)))
  end
  attribs = JSON.parse(load_fixture(:index))
  allow(system).to receive(:systems).and_return(attribs['systems'])
  attribs['systems'][0].each_pair do |k,v|
    allow(system).to receive(k.to_sym).and_return(v)
  end
  system
end



def load_fixture(method_name)
  File.read(FIXTURE_DIR + '/' + method_name.to_s + '.json')
end

end