require 'rails_helper'

RSpec.describe Club, type: :model do
  describe 'validations' do
    let!(:name) {Faker::Lorem.word}
    let!(:address) {Faker::Address.full_address}
    let!(:club_data1) { {name: name, address: address}}
    let!(:club_data2) { {name: name, address: Faker::Address.full_address}}
    let!(:club_data3) { {name: Faker::Lorem.word, address: address}}
    let!(:add1) {described_class.create(club_data1)}
    let!(:add2) {described_class.new(club_data2)}
    let!(:add3) {described_class.new(club_data3)}

    it 'adds and gets data' do
      name = Faker::Lorem.word
      address = Faker::Address.full_address
      data = described_class.new(name: name, address: address)
      expect(data.save).to eq(true)
      expect(described_class.find_by(name: name,  address: address).present?).to eq(true)
    end

    it 'created repeated described_class record' do
      expect(add2.valid?).to eq(false)
      expect(add3.valid?).to eq(false)
    end

    it { should validate_presence_of(:name).with_message('не может быть пустым') }
    it { should validate_presence_of(:address).with_message('не может быть пустым') }

    context 'when name - invalid' do
      it { should_not allow_value(rand(1000)).for(:name) }
      it { should_not allow_value(Faker::Lorem.word+rand(100).to_s).for(:name) }
    end

    context 'when name - valid' do
      it { should allow_value(Faker::Lorem.word).for(:name) }
      it { should allow_value(Faker::Lorem.word+' '+Faker::Lorem.word).for(:name) }
    end
  end  
end


