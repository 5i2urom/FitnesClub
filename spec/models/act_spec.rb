require 'rails_helper'

RSpec.describe Act, type: :model do
  describe 'validations' do
    let!(:act_data) { {activity: Faker::Lorem.word}}
    let!(:add1) {described_class.create(act_data)}
    let!(:add2) {described_class.new(act_data)}
    
    it 'created repeated act record' do
      expect(add2.valid?).to eq(false)
    end

    it { should validate_presence_of(:activity).with_message('не может быть пустым') }

    context 'when activity - invalid' do
      it { should_not allow_value(rand(1000)).for(:activity) }
      it { should_not allow_value(Faker::Lorem.word+rand(100).to_s).for(:activity) }
    end

    context 'when activity - valid' do
      it { should allow_value(Faker::Lorem.word).for(:activity) }
      it { should allow_value(Faker::Lorem.word+' '+Faker::Lorem.word).for(:activity) }
    end

  end
  
end
