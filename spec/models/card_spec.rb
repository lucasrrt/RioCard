require 'app/models/card'
require 'app/models/recharge'
require 'app/models/vehicle'
require 'spec/spec_helper'

RSpec.describe Card, type: :model do
    describe "balance" do
        before :each do
            @normal_user = User.create name: "Lucas", birthdate: Time.now(), fingerprint: "12", is_student: false
            @vehicle = Vehicle.create kind: "bus", line: "512", price: 5
            @card = Card.create code: "card1"
        end
        it "balance is zero when there is no recharges and travels" do
            expect(@card.balance).to be 0
        end
        it "has values when is recharged" do
            Recharge.create card_id: @card.id, value: 50
            expect(@assignment.score).to be 50
        end
        
        it "after one bus travel" do
            Recharge.create card_id: @card.id, value: 50
            Travel.create card_id: @card.id, vehicle_id: @vehicle.id
            expect(@assignment.score).to be 45
        end
    end
end
