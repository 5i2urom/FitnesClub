# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarRecord, type: :model do
  describe 'validations' do
    let!(:start_time) { 10.days.ago }
    let!(:end_time) { 10.days.after }
    let!(:calendar_record_data1) { { start_time:, end_time: } }
    let!(:calendar_record_data2) { { start_time:, end_time: 20.days.after } }
    let!(:calendar_record_data3) { { start_time: 20.days.ago, end_time: } }
    let!(:add1) { described_class.create(calendar_record_data1) }
    let!(:add2) { described_class.new(calendar_record_data2) }
    let!(:add3) { described_class.new(calendar_record_data3) }

    it 'created repeated described_class record' do
      expect(add2.valid?).to eq(false)
      expect(add3.valid?).to eq(false)
    end
    it { should validate_presence_of(:start_time).with_message('не может быть пустым') }
    it { should validate_presence_of(:end_time).with_message('не может быть пустым') }

    it 'cant add when time is same' do
      same = described_class.new(start_time: end_time, end_time:)
      expect(same.save).to eq(false)
    end

    context 'when start_time - invalid' do
      it { should_not allow_value('22-12-2022').for(:start_time) }
    end

    context 'when end_time - valid' do
      it { should allow_value('23-12-2022').for(:end_time) }
    end
  end
end
