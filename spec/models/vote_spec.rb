require 'rails_helper'

describe Vote do
  describe "Vote model validations" do

    before do
      @v = Vote.new(value: 1)
      @v2 = Vote.new(value: -1)
      @v3 = Vote.new(value: 2)  
    end

    describe "#validations" do
      it "Validates that values entered in the Model table are limited to -1 or 1" do 
        expect( @v.valid? ).to eq(true)
        expect( @v2.valid? ).to eq(true)
        expect( @v3.valid? ).to eq(false)
      end
    end

  end 
end
