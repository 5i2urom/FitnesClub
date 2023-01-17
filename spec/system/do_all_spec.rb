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
  let!(:user_name) { Faker::Name.first_name }
  let!(:email) { Faker::Internet.email }
  let!(:password) { Faker::Alphanumeric.alphanumeric(number: 10) }
  before do
    Service.create!(name: serv_name)
    Act.create!(service: Service.first, activity: act_name)
    Club.create!(name: club_name, address: club_address)
    ClubAct.create!(act: Act.first, club: Club.first)
    # p coach_name
    Coach.create!(act: Act.first, name: coach_name)
    CalendarRecord.create!(coach: Coach.first, club: Club.first, start_time:, end_time:, limit: 3)
  end

  scenario 'if authorized do all' do
    my_date = CalendarRecord.first.start_time.strftime('%d-%m-%Y')
    my_start = CalendarRecord.first.start_time.strftime('%H:%M')
    my_end = CalendarRecord.first.end_time.strftime('%H:%M')
    my_time = "#{my_start}-#{my_end}"

    visit new_user_registration_path
    expect(page).to have_text('Регистрация')
    find("input[placeholder='Имя']").set user_name
    find("input[placeholder='Email']").set email
    find("input[placeholder='Пароль']").set password
    find("input[placeholder='Подтвердите пароль']").set password
    click_button('Регистрация')
    expect(page).to have_text('Добро пожаловать! Вы успешно зарегистрировались.')

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

    find('#zap').click
    sleep(1)
    expect(page).to have_text("Выберите клуб для занятия: #{act_name}")

    find('#club').click
    sleep(2)
    expect(page).to have_text("Календарь: #{act_name} в #{club_name}")
    expect(page).to have_text('января 2023')
    expect(page).to have_text(coach_name)
    expect(page).to have_text('Свободно 3/3') #лимит

    click_button(my_time)
    click_button('Подтвердить')
    click_button('Выйти')
    expect(page).to have_text('Вы записаны')

    visit user_profile_path
    expect(page).to have_text('Мой профиль')
    expect(page).to have_text("Имя: #{user_name}")
    expect(page).to have_text("Email: #{email}")
    expect(page).to have_text('Мои записи')

    expect(page).to have_text("Услуги: #{serv_name}")
    expect(page).to have_text("Занятие: #{act_name}")
    expect(page).to have_text("Клуб: #{club_name}")
    expect(page).to have_text("Тренер: #{coach_name}")
    expect(page).to have_text("Дата: #{my_date}")
    expect(page).to have_text("Время: #{my_time}")

    click_button('Отменить запись')

    find('#quit_button').click
    expect(page).to have_text("До встречи, #{user_name}!")
  end
end
