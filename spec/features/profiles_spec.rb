require "rails_helper"

describe "Visiting Profiles" do

  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = authenticated_user 
    @post = associated_post(user: @user)
    @comment = Comment.create(user: @user, body: "A Comment")
  end

  describe "not signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end

  end

  describe "signed in" do

    before do
      @user = FactoryGirl.create(:user)
      @user.confirmed_at = Time.now
      @user.save
      login_as(@user, :scope => :user)
    end

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end

    Warden.test_reset!

  end

end