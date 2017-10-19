require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'user logs in' do
    create(:user)
    visit '/'
    fill_in 'Employee Number', with: 12345
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page.current_path).to eq parts_path
  end
end
