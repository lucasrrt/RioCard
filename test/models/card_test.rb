require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user existence" do
    # set the id in this card_params

    # case 1 : an existing user
    @card = Card.new(card_params)
    assert user_existence

    # case 2 : non existing user
    @card = Card.new(card_params)
    assert user_existence
  end

  test "balance" do

  end
end
