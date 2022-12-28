# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'join', type: :system do
  let!(:user_name) { Faker::Name.first_name }
  let!(:email) { Faker::Internet.email }
  let!(:password) { Faker::Alphanumeric.alphanumeric(number: 10) }

  scenario 'authorize => no records' do
    visit new_user_registration_path
    expect(page).to have_text('Регистрация')
    find("input[placeholder='Имя']").set user_name
    find("input[placeholder='Email']").set email
    find("input[placeholder='Пароль']").set password
    find("input[placeholder='Подтвердите пароль']").set password
    click_button('Регистрация')
    expect(page).to have_text('Добро пожаловать! Вы успешно зарегистрировались.')
    expect(page).to have_text('Сеть фитнес клубов RomanOff')

    find('#quit_button').click
    expect(page).to have_text("До встречи, #{user_name}!")
    expect(page).to have_text('Сеть фитнес клубов RomanOff')

    visit new_user_session_path
    expect(page).to have_text('Вход')
    find("input[placeholder='Email']").set email
    find("input[placeholder='Пароль']").set password
    click_button('Войти в аккаунт')
    expect(page).to have_text("Добро пожаловать, #{user_name}")
    expect(page).to have_text('Сеть фитнес клубов RomanOff')

    visit user_profile_path
    expect(page).to have_text('Мой профиль')
    expect(page).to have_text("Имя: #{user_name}")
    expect(page).to have_text("Email: #{email}")
    expect(page).to have_text('Мои записи')
    expect(page).to have_text('У вас еще нет записей')
  end
end
