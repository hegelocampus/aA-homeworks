require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do
    it "correctly evaluates if an input is the user's password" do
      test_user = User.new
      test_user.password = "test"

      expect(test_user.is_password?("test")).to be true
      expect(test_user.is_password?("no_test")).to be false
      expect(test_user.is_password?("")).to be false
      expect(test_user.is_password?("aoeuaoeuaoeu',.p',.p',.p")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "changes the session_token to a new value and return the new session token" do
      session_token = User.generate_session_token
      test_user = User.new(session_token: session_token, email: "test_email@email.com")
      test_user.password = "test_long_enough"

      expect(test_user.reset_session_token!).to be(test_user.session_token)
      expect(test_user.session_token).not_to be(session_token)
    end
  end

  describe "::find_by_credentials" do
    it "return the user who's email and password match the input" do
      test_user = User.new(email: "test_email@email.com")
      test_user.password = "test_long_enough"
      test_user.ensure_session_token
      test_user.save!

      expect(User.find_by_credentials("test_email@email.com", "test_long_enough")).to eql(test_user)
    end

    it "returns nil if the password is not a match" do
      test_user = User.new(email: "test_email@email.com")
      test_user.password = "test_long_enough"
      test_user.ensure_session_token
      test_user.save!

      expect(User.find_by_credentials("test_email@email.com", "wrong_pass")).to be_nil
    end
  end
end
