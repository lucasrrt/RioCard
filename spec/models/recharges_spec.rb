require 'app/models/recharge'
require 'app/models/card'
require 'spec/spec_helper'

RSpec.describe Recharge, type: :model do
    describe "age" do
        before do
            @recharge = Recharge.create
        end
        it "return false cause there is not a card" do
            expect(@recharge.card_existence).to be false
        end

        before do
            @card = Card.create code: "card1"
            @recharge = Recharge.create
        end
        it "return true cause there is a card" do
            expect(@recharge.card_existence).to be true
        end
    end
end
