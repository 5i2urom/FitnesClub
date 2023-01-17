require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    let!(:user_data) do
      { name: Faker::Name.first_name, email: Faker::Internet.email,
        password: Faker::Alphanumeric.alphanumeric(number: 10) }
    end
    let!(:add_user) { User.create(user_data) }
    let!(:add1) { described_class.create(user: add_user) }
    let!(:add2) { described_class.create(user: add_user) }

    it 'created repeated described_class record' do
      expect(add2.valid?).to eq(false)
    end
  end
end
