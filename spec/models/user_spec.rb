require 'rails_helper'

RSpec.describe User, type: :model do
    let(:incomplete_user){
        User.new(username: '',
        email: 'email.aa.io',
        password: 'notpassword')
    }

    # Old way sucks
    # it 'validates presence of a username' do
    #     expect(incomplete_user).to_not be_valid
    # end

    # New way rocks, ft. shoulda matchers
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should have_many(:chirps) }
    # it { should validate_uniqueness_of(:username) }

    # subject(:toby) { User.create(
    #     username: 'toby',
    #     email: 'toby@aa.io',
    #     age: 5,
    #     political_affiliation: 'Hufflepuff',
    #     password: 'password'
    # )}

    describe 'uniqueness' do
        before :each do
            create(:user)
        end

        it { should validate_uniqueness_of(:username) }
        it { should validate_uniqueness_of(:session_token) }
    end

    describe "is_password?" do
        let!(:user) { create(:user) }

        context "with a valid password" do
            it "should return true" do
                expect(user.is_password?("password")).to be true
            end
        end

        context "with an invalid password" do
            it "should return false" do
                expect(user.is_password?("banana")).to be false
            end
        end
    end

    describe 'password encryption' do
        it 'does not save passwords to the database' do
            FactoryBot.create(:user, username: "Harry Potter")

            user = User.find_by(username: "Harry Potter")
            expect(user.password).not_to eq('password')
        end

        it 'encrypts password using BCrypt' do
            expect(BCrypt::Password).to receive(:create).with('abcdef')

            FactoryBot.build(:user, password: 'abcdef')
        end
    end
end