require 'acceptance/acceptance_helper'

feature 'User can send_files', 'I want to send file to another user' do

  given!(:teacher) { create(:teacher) }
  given!(:teacher_profile) { create(:teacher_profile, user: teacher) }

  given!(:admin) { create(:admin) }
  given!(:admin_profile) { create(:admin_profile, user: admin) }

  given!(:chat) { create(:chat, users: [teacher, admin]) }

  context 'multiple sessions', js: true do
    scenario 'send_file odt' do
      Capybara.using_session('teacher') do
        sign_in(teacher)
      end

      Capybara.using_session('admin') do
        sign_in(admin)
      end

      Capybara.using_session('teacher') do
        visit my_messenger_path
        find(:xpath, './/html/body/div[2]/div/div[1]/a/button').click
        fill_in 'message_content', with: 'blah-blah'
        attach_file('file-input', File.absolute_path('/home/edwinna/scholar/spec/fixtures/attachments/doc1.odt'))
        click_on 'Отправить'

        expect(page).to have_content('blah-blah')
        expect(page).to have_content('doc1.odt')
      end

      Capybara.using_session('admin') do
        visit my_messenger_path
        find(:xpath, './/html/body/div[2]/div/div[1]/a/button').click

        expect(page).to have_content('blah-blah')
        expect(page).to have_content('doc1.odt')
      end
    end

    scenario 'send_file odt' do
      Capybara.using_session('teacher') do
        sign_in(teacher)
      end

      Capybara.using_session('admin') do
        sign_in(admin)
      end

      Capybara.using_session('teacher') do
        visit my_messenger_path
        find(:xpath, './/html/body/div[2]/div/div[1]/a/button').click
        fill_in 'message_content', with: 'blah-blah'
        attach_file('file-input', File.absolute_path('/home/edwinna/scholar/spec/fixtures/attachments/impress.odp'))
        click_on 'Отправить'

        expect(page).to have_content('blah-blah')
        expect(page).to have_content('impress.odp')
      end

      Capybara.using_session('admin') do
        visit my_messenger_path
        find(:xpath, './/html/body/div[2]/div/div[1]/a/button').click

        expect(page).to have_content('blah-blah')
        expect(page).to have_content('impress.odp')
      end
    end
  end
end
