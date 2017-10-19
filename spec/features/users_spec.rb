require 'rails_helper'

RSpec.feature "Users", type: :feature do
  xscenario 'user logs in' do
    create(:user)
    visit '/'
    fill_in 'Employee Number', with: 12345
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page.current_path).to be ''
  end
end
