require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    let!(:serv_data) { {name: Faker::Lorem.word}}
    let!(:add1) {Service.create(serv_data)}
    let!(:add2) {Service.new(serv_data)}

    it 'adds and gets data' do
      name = Faker::Lorem.word
      data = Service.new(name: name)
      expect(data.save).to eq(true)
      expect(Service.find_by(name: name).present?).to eq(true)
    end

    it 'created repeated service record' do
      expect(add2.valid?).to eq(false)
    end

    it { should validate_presence_of(:name).with_message('не может быть пустым') }

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
