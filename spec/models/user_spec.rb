require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it 'is valid with a name and email' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = '  '
      expect(user).to_not be_valid
    end

    it 'is invalid without an email' do
      user.email = '  '
      expect(user).to_not be_valid
    end
    
    it 'is valid with a name with 50 characters' do
      user.name = 'a' * 50
      expect(user).to be_valid
    end

    it 'is invalid with a name with more than 50 characters' do
      user.name = 'a' * 51
      expect(user).to_not be_valid
    end

    it 'is valid with a email with 255 characters' do
      user.email = 'a' * 243 + '@example.com'
      expect(user).to be_valid
    end

    it 'is invalid with a email with more than 255 characters' do
      user.email = 'a' * 256
      expect(user).to_not be_valid
    end

    it 'is valid with a email format' do
      valid_addresses = %w[user@example.com USER@foo.com
                     A_US-ER@foo.bar.org first.last@foo.jp
                     alize+bob@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it 'is invalid with a email format' do
      invalid_addresses = %w[user@example,com USER.foo.com
                     A_US-ER@foo_bar.org first.last@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end

    it 'is invalid with a duplicate email' do
      duplicate_user = user.dup
      user.save
      expect(duplicate_user).to_not be_valid 
    end 
    
    it 'is invalid with a no case sensitive duplicate email' do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect{ duplicate_user.save }.to raise_error
    end

    it 'is invalid with a blank password' do
      user.password = user.password_confirmation = ' ' * 6
      expect(user).to_not be_valid
    end
    
    it 'is valid with a password with 6 characters' do
      user.password = user.password_confirmation = 'a' * 6 
      expect(user).to be_valid
    end
    
    it 'is invalid with a password with less than 6 characters' do
      user.password = user.password_confirmation = 'a' * 5 
      expect(user).to_not be_valid
    end
  end
end
 
