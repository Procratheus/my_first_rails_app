describe "Topic" do

  describe "scopes" do

    before do
      @public_topic = Topic.create
      @private_topic = Topic.create(public: false)
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect( Topic.publicly_viewable ).to eq( [@public_topic] )
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all privately viewable topics" do
        expect( Topic.privately_viewable ).to eq( [@private_topic] )
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if a user is present" do
        user = create(:user)
        expect( Topic.visible_to(user) ).to eq( Topic.all )
      end

      it "returns only public topics if a user is nil" do
        user = nil
        expect( Topic.visible_to(user) ).to eq( Topic.publicly_viewable )
      end
    end  

  end

end