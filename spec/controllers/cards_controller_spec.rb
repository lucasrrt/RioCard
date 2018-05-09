require 'app/controllers/cards_controller'
require 'spec/spec_helper'

Rspec.describe CardsController, '# create cards' do
    context "with an existing user" do
        it "tries to create an user that already exists" do
            cards_controller = CardsController.new
            # do the rest
        end
    end
end