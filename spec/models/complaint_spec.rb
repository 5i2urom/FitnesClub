require 'rails_helper'

RSpec.describe Complaint, type: :model do
  describe 'validations' do
    let!(:user_data) do
      { name: Faker::Name.first_name, email: Faker::Internet.email,
        password: Faker::Alphanumeric.alphanumeric(number: 10) }
    end
    let!(:add_user) { User.create!(user_data) }

    let!(:complaint_data) { { user: add_user, message: Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false),
      status: 0, theme: 'Faker::Lorem.word'} }
    let!(:add1) { described_class.create!(complaint_data) }
    let!(:add2) { described_class.new(complaint_data) } #повторение
    
    let!(:user_data2) do
      { name: Faker::Name.first_name, email: Faker::Internet.email,
        password: Faker::Alphanumeric.alphanumeric(number: 10) }
    end
    let!(:add_user2) { User.create!(user_data2) }
    let!(:add_employee2) { Employee.create!(user: add_user2) } #одинаковые


    let!(:complaint_data2) { { user: add_user2, employee: add_employee2, message: Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false),
      status: 0, theme: 'Faker::Lorem.word', response: "ok"} }
    let!(:add3) { described_class.new(complaint_data2) }

    it 'allows created repeated described_class record' do
      expect(add2.valid?).to eq(true)
    end

    it 'when ids - invalid' do
      expect(add3.valid?).to eq(false)
    end

    it { should validate_presence_of(:message).with_message('не может быть пустым') }
    it { should validate_presence_of(:theme).with_message('не может быть пустым') }

    it { should_not validate_presence_of(:employee_id).with_message('не может быть пустым') }
    it { should_not validate_presence_of(:response).with_message('не может быть пустым') }
  end
end
