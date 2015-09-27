describe OmniAuth::Strategies::GoStatic do

  let(:app) { lambda{ |env| [200, {}, ["Hello World."]] } }

  describe "#name" do
    it "has the correct name" do
      strategy = OmniAuth::Strategies::GoStatic.new(app)
      expect(strategy.name).to eq 'gostatic'
    end
  end

end
