module SignInMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_iin', with: user.iin
    fill_in 'user_password', with: user.password
    click_on 'Войти'
    # wait_for_ajax
    sleep 5
  end
end
