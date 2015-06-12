require 'rails

_helper'
describe Answer do
  context "validations" do
    it { should validate_presence_of :body }
    it "body must be present" do
      expect {
        answer = Answer.new
        answer.save
        expect(answer.errors.full_messages).to include("Body can't be blank")
      }.not_to change { Answer.count }
    end
  end
end
