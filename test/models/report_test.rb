# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:tanaka_report)
  end

  test '#editable?' do
    user = users(:tanaka)
    other_user = users(:sato)
    @report.user = user

    assert(@report.editable?(user), '日報作成者は、編集が可能')
    assert_not(@report.editable?(other_user), '日報作成者以外は、編集不可')
  end

  test '#created_on' do
    @report.created_at = '2026-01-29'
    assert_equal Date.new(2026, 1, 29), @report.created_on
  end

  test '#save_mentions' do
    @report.content = 'メンションテスト http://localhost:3000/reports/1'
    assert_equal(0, @report.mentioning_reports.count, 'メンションが無い')
    @report.save
    assert_equal(1, @report.mentioning_reports.count, '1つのメンションがある')
    @report.content = 'メンションテスト http://localhost:3000/reports/1 メンションテスト2 http://localhost:3000/reports/2'
    @report.save
    assert_equal(2, @report.mentioning_reports.count, '2つのメンションがある')
  end
end
