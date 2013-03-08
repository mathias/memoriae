step "I am logged in" do
  @user = create(:user)
  visit('/users/sign_in')
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password'
  click_on 'Sign in'
end
