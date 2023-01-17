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

    let!(:user_name1) { Faker::Name.first_name }
    let!(:email1) { Faker::Internet.email }
    let!(:password1) { Faker::Alphanumeric.alphanumeric(number: 10) }

    let!(:user_name2) { Faker::Name.first_name }
    let!(:email2) { Faker::Internet.email }
    let!(:password2) { Faker::Alphanumeric.alphanumeric(number: 10) } # лимит - 1

    before do
      Service.create!(name: serv_name)
      Act.create!(service: Service.first, activity: act_name)
      Club.create!(name: club_name, address: club_address)
      ClubAct.create!(act: Act.first, club: Club.first)
      # p coach_name
      Coach.create!(act: Act.first, name: coach_name)
      CalendarRecord.create!(coach: Coach.first, club: Club.first, start_time:, end_time:, limit: 1)
    end

    scenario 'limited' do
        my_date = CalendarRecord.first.start_time.strftime('%d-%m-%Y')
        my_start = CalendarRecord.first.start_time.strftime('%H:%M')
        my_end = CalendarRecord.first.end_time.strftime('%H:%M')
        my_time = "#{my_start}-#{my_end}"
    
        visit new_user_registration_path
        find("input[placeholder='Имя']").set user_name1
        find("input[placeholder='Email']").set email1
        find("input[placeholder='Пароль']").set password1
        find("input[placeholder='Подтвердите пароль']").set password1
        click_button('Регистрация')

        sleep(1)
        find('#servs').click
        sleep(1)    
        find('#serv').click
        sleep(1)    
        find('#act').click
        sleep(1)    
        find('#zap').click
        sleep(1)    
        find('#club').click
        sleep(1)

        expect(page).to have_text(coach_name)
        expect(page).to have_text('Свободно 1/1') #лимит
    
        click_button(my_time)
        click_button('Подтвердить')
        sleep(1)
        click_button('Выйти')
        expect(page).to have_text('Вы записаны')
        find('#quit_button').click
        expect(page).to have_text("До встречи, #{user_name1}!") #вышли

        visit new_user_registration_path # регистрируем 2 учетную запись
        find("input[placeholder='Имя']").set user_name2
        find("input[placeholder='Email']").set email2
        find("input[placeholder='Пароль']").set password2
        find("input[placeholder='Подтвердите пароль']").set password2
        click_button('Регистрация')

        find('#servs').click
        sleep(1)    
        find('#serv').click
        sleep(1)    
        find('#act').click
        sleep(1)    
        find('#zap').click
        sleep(1)    
        find('#club').click
        sleep(1)

        expect(page).to have_text(coach_name)
        expect(page).to have_text('Запись закрыта') # превышен лимит
      end
end