require 'rails_helper'
RSpec.describe 'deleting account' do
  it 'destroys user and redirects to registration page' do
    user = create_user
    log_in user
    click_link 'Edit Profile'
    click_button 'Delete Account'
    expect(current_path).to eq('/users/new')
  end
end