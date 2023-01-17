# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'join', type: :system do

    let!(:user_name1) { Faker::Name.first_name }
    let!(:email1) { Faker::Internet.email }
    let!(:password1) { Faker::Alphanumeric.alphanumeric(number: 10) }

    let!(:user_name2) { Faker::Name.first_name }
    let!(:email2) { Faker::Internet.email }
    let!(:password2) { Faker::Alphanumeric.alphanumeric(number: 10) }

    let!(:user_data) { { name: user_name1, email: email1, password: password1} }
    let!(:employee_user_data) { { name: user_name2, email: email2, password: password2} }

    before do
        user = User.create!(user_data)
        employee = User.create!(employee_user_data)
        Employee.create(user: employee)
    end

    scenario 'complaints' do    
        visit new_user_session_path #входим как юзер
        find("input[placeholder='Email']").set email1
        find("input[placeholder='Пароль']").set password1
        click_button('Войти в аккаунт')

        sleep(1)
        3.times do
            visit complaint_new_path
            sleep(1)    
            find("input[placeholder='Тема:']").set Faker::Lorem.word
            find('#problem').set Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false)
            click_button('Отправить')
            expect(page).to have_text('История жалоб')
            expect(page).to have_text("Статус жалобы: Жалоба принята к рассмотрению")
        end
        find('#quit_button').click #вышли
        sleep(1)

        visit new_user_session_path # входим как сотрудник
        find("input[placeholder='Email']").set email2
        find("input[placeholder='Пароль']").set password2
        click_button('Войти в аккаунт')
        sleep(1)

        visit complaint_active_path
        expect(page).to have_text(email1) #нашли обращения юзера
        first('#decl').click
        sleep(1)
        first('#send').click 

        sleep(1)
        visit complaint_archive_path
        expect(page).to have_text('Жалоба отклонена')
        expect(page).to have_text('Успешно завершено') # и одна осталась активная
        find('#quit_button').click #вышли

        sleep(1)
        visit new_user_session_path #снова входим как юзер
        find("input[placeholder='Email']").set email1
        find("input[placeholder='Пароль']").set password1
        click_button('Войти в аккаунт')

        sleep(1)
        visit complaint_history_path
        expect(page).to have_text('Статус жалобы: Жалоба принята к рассмотрению')
        expect(page).to have_text('Статус жалобы: Успешно завершено')
        expect(page).to have_text('Статус жалобы: Жалоба отклонена')
      end
end