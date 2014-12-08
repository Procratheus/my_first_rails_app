require 'rails_helper'

describe Post do

  include TestFactories

  describe "vote methods" do

    before do
      @post = associated_post
      allow(@post).to receive(:save_with_initial_vote)
      3.times do 
        @post.votes.create(value: 1) 
      end
      2.times do
        @post.votes.create(value: -1)
      end
    end

    describe "#create_vote" do
      it "adds a up-vote immediately after a new post is created" do
        post = associated_post
        expect( post.up_votes ).to eq(0)
        post.save_with_initial_vote
        expect( post.up_votes ).to eq(1)
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
