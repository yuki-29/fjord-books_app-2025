# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email: 名前がある場合は名前を返す' do
    user = users(:tanaka)
    assert_equal 'Tanaka', user.name_or_email
  end

  test '#name_or_email: 名前がない場合はメールアドレスを返す' do
    user = users(:sato)
    assert_equal 'sato@example.com', user.name_or_email
  end
end
