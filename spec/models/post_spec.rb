require "rails_helper"

describe Post do

  describe "vote methods" do

    before do
      @post = Post.create(title: "post title", body: "post body")
      3.times do 
        @post.votes.create(value: 1) 
      end
      2.times do
        @post.votes.create(value: -1)
      end
    end

    describe "#up-votes" do
      it "counts the number of votes with a value of 1" do
        expect( @post.up_votes.count ).to eq(3) 
      end
    end

    describe "#down-votes" do
      it "counts the number of votes with a value of -1" do
        expect( @post.down_votes.count).to eq(-2)
      end
    end

    describe "#points" do
      it "returns the result of adding #up-votes to #down-votes" do
        expect( @post.points.count).to eq(1)
      end
    end
  end

end

describe Vote do
  describe "Vote model validations" do

    before do
      v = Vote.new(value: 1)
      v2 = Vote.new(value: -1)
      v3 = Vote.new(value: 2)  
    end

    describe "#validations" do
      it "Validates that values entered in the Model table are limited to -1 or 1" do 
        expect ( v.valid? ).to eq(true)
        expect ( v2.valid? ).to eq(true)
        expect ( v3.valid? ).to eq(false)
      end
    end

  end 
end
