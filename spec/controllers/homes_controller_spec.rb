RSpec.describe ArticlesController, type: :controller do
  describe "#top" do
    it "responds successfully" do
      get :top
      expect(response).to be_success
    end
  end
end