# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'join', type: :system do
  let!(:serv_name) { Faker::Lorem.word }
  let!(:act_name) { Faker::Lorem.word }
  let!(:club_name) { Faker::Lorem.word }
  let!(:club_address) { Faker::Address.full_address }
  let!(:coach_name) { Faker::Name.name }
  let!(:start_time) { Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 3, period: :morning) }
  let!(:end_time) { start_time + 7200 }
  before do
    Service.create!(name: serv_name)
    Act.create!(service: Service.first, activity: act_name)
    Club.create!(name: club_name, address: club_address)
    ClubAct.create!(act: Act.first, club: Club.first)
    # p coach_name
    Coach.create!(act: Act.first, name: coach_name)
    CalendarRecord.create!(coach: Coach.first, club: Club.first, start_time:, end_time:)
  end

  scenario 'reversed step by step' do
    visit root_path
    expect(page).to have_text('Сеть фитнес клубов RomanOff')

    find('#servs').click
    sleep(1)
    expect(page).to have_text('Услуги')

    find('#serv').click
    sleep(1)
    expect(page).to have_text(serv_name)

    find('#act').click
    sleep(1)
    expect(page).to have_text(act_name)

    find('#back').click
    sleep(1)
    expect(page).to have_text(serv_name)

    find('#back').click
    sleep(1)
    expect(page).to have_text('Услуги')

    find('#back').click
    sleep(1)
    expect(page).to have_text('Сеть фитнес клубов RomanOff')
  end
end
