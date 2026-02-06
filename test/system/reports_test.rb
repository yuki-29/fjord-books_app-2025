# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:tanaka_report)
    user = users(:tanaka)
    sign_in_for_systemtest(user)
  end

  test 'should create report' do
    visit reports_url
    click_on '日報の新規作成'
    fill_in '内容', with: 'Railsのテストについて学んだ。'
    fill_in 'タイトル', with: 'テスト技法の学習をした。'
    click_on '登録する'
    assert_text '日報が作成されました。'

    click_on '日報の一覧に戻る'
  end

  test 'should update Report' do
    visit report_url(@report)
    click_on 'この日報を編集'
    fill_in '内容', with: 'Railsのテストについて学んだ。'
    fill_in 'タイトル', with: 'テスト技法の学習をした。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    click_on '日報の一覧に戻る'
  end

  test 'should destroy Report' do
    visit report_url(@report)
    click_on 'この日報を削除'

    assert_text '日報が削除されました。'
    assert_selector 'h1', text: '日報の一覧'
  end
end
