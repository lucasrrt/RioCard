require 'app/models/travel'
require 'app/models/card'
require 'app/models/vehicle'
require 'spec/spec_helper'

RSpec.describe Recharge, type: :model do
    describe "age" do
        before do
            @travel = Travel.create
        end
        it "return false cause there is not a vehicle" do
            expect(@travel.vehicle_existence).to be false
        end
        
        before do
            @vehicle = Vehicle.create kind: "bus", line: "512", price: 5
            @travel = Travel.create
        end
        it "return true cause there is a vehicle" do
            expect(@travel.vehicle_existence).to be true
        end
    end
end
