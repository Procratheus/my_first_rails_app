require 'rails_helper'

describe Post do

  describe "vote methods" do

    before do
      @post = Post.create(title: "post title", body: "Post bodies must be pretty long")
      3.times do 
        @post.votes.create(value: 1) 
      end
      2.times do
        @post.votes.create(value: -1)
      end
    end

    describe "#up-votes" do
      it "counts the number of votes with a value of 1" do
        expect( @post.up_votes ).to eq(3) 
      end
    end

    describe "#down-votes" do
      it "counts the number of votes with a value of -1" do
        expect( @post.down_votes).to eq(-2)
      end
    end

    describe "#points" do
      it "returns the result of adding #up-votes to #down-votes" do
        expect( @post.points).to eq(1)
      end
    end
  end

end
