require 'acceptance/acceptance_helper'

feature 'User can send_files', 'I want to send file to another user' do

  given!(:teacher) { create(:teacher) }
  given!(:teacher_profile) { create(:teacher_profile, user: teacher) }

  given!(:admin) { create(:admin) }
  given!(:admin_profile) { create(:admin_profile, user: admin) }

  given!(:chat) { create(:chat, users: [teacher, admin]) }

  context 'multiple sessions', js: true do
    scenario 'send_file' do
      Capybara.using_session('admin') do
        sign_in(admin)
        visit "my/messenger?current_chat=#{chat.id}"
        fill_in 'message_content', with: 'blah-blah'
        attach_file('file-input', File.absolute_path('/home/edwinna/scholar/spec/fixtures/attachments/4.jpg'))
        click_on 'Отправить'

        expect(page).to have_content('blah-blah')
        expect(page.find('.message_attachment')['src']).to have_content '4.jpg'
      end

      Capybara.using_session('teacher') do
        sign_in(teacher)
        # visit my_messenger_path
        # find(:xpath, './/html/body/div[2]/div/div[1]/a/button').click
        visit "my/messenger?current_chat=#{chat.id}"
        # find(:xpath, './/html/body/div[2]/div/div[1]/a/button').click
        expect(page).to have_content('blah-blah')
        expect(page.find('.message_attachment')['src']).to have_content '4.jpg'
      end
    end
  end
end
