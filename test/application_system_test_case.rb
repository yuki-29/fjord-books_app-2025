# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400] do |options|
    options.add_argument('--disable-gpu')
    options.add_preference('profile.password_manager_leak_detection', false)
  end

  def sign_in_for_systemtest(user)
    visit root_url
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: 'Password!'
    click_button 'ログイン'
    assert_text 'ログインしました。'
  end
end
