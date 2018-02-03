require 'acceptance/acceptance_helper'
# green  9.11
feature 'User can create new chat', 'In order to be able to communicate
  As a user I want to be able to create chats with other' do

  given!(:teacher) { create(:teacher) }
  given!(:teacher_profile) { create(:teacher_profile, user: teacher) }

  given!(:teacher2) { create(:teacher) }
  given!(:teacher_profile2) { create(:teacher_profile, user: teacher2) }

  given!(:student) { create(:student) }
  given!(:student_profile) { create(:student_profile, user: student) }

  given!(:student2) { create(:student) }
  given!(:student_profile2) { create(:student_profile, user: student2) }

  # given!(:custodian) { create(:custodian) }
  # given!(:custodian_profile) { create(:custodian_profile, user_id: custodian.id) }

  given!(:admin) { create(:admin) }
  given!(:admin_profile) { create(:admin_profile, user: admin) }

  given!(:admin2) { create(:admin) }
  given!(:admin_profile2) { create(:admin_profile, user: admin2) }

  context 'Teacher can create conversation with teacher', js: true do
    scenario 'create' do
      sign_in(teacher)
      visit my_messenger_path

      # start new dialog
      click_on 'Начать новый диалог'

      # Chose fellow
      within '.modal-content' do
        fill_in 'search-user', with: Faker::String.random(15)
        expect(page).to_not have_content teacher2.first_name
        fill_in 'search-user', with: teacher2.first_name
        click_on teacher2.full_name
        click_on 'Начать диалог'
      end

      # expect to have a brand new chat
      expect(page).to have_content(teacher2.full_name)
    end

    scenario 'create' do
      sign_in(student)
      visit my_messenger_path

      # start new dialogue
      click_on 'Начать новый диалог'

      # Chose fellow
      within '.modal-content' do
        fill_in 'search-user', with: Faker::String.random(15)
        expect(page).to_not have_content student2.first_name
        fill_in 'search-user', with: student2.first_name
        click_on student2.full_name
        click_on 'Начать диалог'
      end

      # expect to have a brand new chat
      expect(page).to have_content(student2.full_name)
    end

    scenario 'create' do
      sign_in(admin)
      visit my_messenger_path

      # start new dialogue
      click_on 'Начать новый диалог'

      # Chose fellow
      within '.modal-content' do
        fill_in 'search-user', with: Faker::String.random(15)
        expect(page).to_not have_content admin.first_name
        fill_in 'search-user', with: admin.first_name
        click_on student2.full_name
        click_on 'Начать диалог'
      end

      # expect to have a brand new chat
      expect(page).to have_content(admin.full_name)
    end
=begin
    scenario 'create' do
      click_on 'Начать новый диалог'
      within '.modal-content' do
        fill_in 'search-user', with: Faker::String.random(15)
        expect(page).to_not have_content teacher2.first_name
        fill_in 'search-user', with: teacher2.first_name
        wait_for_ajax
        click_on teacher2.full_name
        click_on 'Начать диалог'
        expect(page).to have_content(teacher2.full_name)
        expect(page).to have_content('Отправить')
      end
    end

    scenario 'create' do
      click_on 'Начать новый диалог'
      within '.modal-content' do
        fill_in 'search-user', with: Faker::String.random(15)
        expect(page).to_not have_content teacher2.first_name
        fill_in 'search-user', with: teacher2.first_name
        wait_for_ajax
        click_on teacher2.full_name
        click_on 'Начать диалог'
        expect(page).to have_content(teacher2.full_name)
        expect(page).to have_content('Отправить')
      end
    end
=begin
    scenario "non-exists message body" do
      click_on "Отправить"
      wait_for_ajax
      expect(page).to have_content("Сообщение не может быть пустым")
    end
=end
  end
end
