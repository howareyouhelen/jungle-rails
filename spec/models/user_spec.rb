require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do
      @user = User.create
      @user.first_name = "Magi"
      @user.last_name = "Karp"
      @user.email = "magi@karp.com"
     
      @user.password = "magikarp123"
      @user.password_confirmation = "magikarp123"
      @user.save

      @baduser = User.create
      @baduser.password = "magickarp"
      @baduser.password_confirmation = "magikarp"
    end
  
  describe 'Validations' do
    it "first_name should be valid" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:first_name]).to include("can't be blank")
    end

    it "last_name should be valid" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:last_name]).to include("can't be blank")
    end

    it "email should be valid" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:email]).to include("can't be blank")
    end

    it "password should be valid" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:password]).to include("can't be blank")
    end

    it "password minimum char" do
      expect(@user).to be_valid
      @userexample = User.create( first_name: 'Carrot', last_name: 'Cake', email: 'carrot@cake.com', password: '12', password_confirmation: '12')
      expect(@userexample.errors.messages[:password]).to include("is too short (minimum is 3 characters)")
    end

     it "password confirmation should be valid" do
      expect(@user).to be_valid
      @userexample2 = User.create( first_name: 'Carrot', last_name: 'Cake', email: 'carrot@cake.com', password: '12', password_confirmation: '')
      expect(@userexample2.errors.messages[:password_confirmation]).to include("can't be blank")
    end

    it "email case sensitivity should be invalid" do
      @userexample3 = User.create( first_name: 'Carrot', last_name: 'Cake', email: 'MAGI@KARP.com', password: '1234', password_confirmation: '1234')
      expect(@userexample3).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "white space should be valid during login" do
      user = User.authenticate_with_credentials(" MAGI@KARP.com ", "magikarp123")
      expect(user).to eq(@user)
    end

    it "case sensitivity should be invalid during login" do
      user = User.authenticate_with_credentials("Magi@KaRp.com", "magikarp123")
      expect(user).to eq(@user)
    end
  end
end