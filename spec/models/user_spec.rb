require 'app/models/user'
require 'spec/spec_helper'

RSpec.describe User, type: :model do
    describe "age" do
        before :each do
            @normal_user = User.create name: "Lucas", birthdate: "16/10/1994", fingerprint: "12", is_student: false
        end
        it "age is 23" do
            expect(@normal_user.age).to be 23
        end
    end
end
