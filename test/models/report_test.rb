# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:tanaka_report)
  end

  test '#editable?' do
    user = users(:tanaka)
    assert(@report.editable?(user))
  end

  test '#created_on' do
    assert_equal '2026/01/29', I18n.l(@report.created_on)
  end

  test '#save_mentions' do
    @report.content = 'メンションテスト http://localhost:3000/reports/1'
    assert_equal 0, @report.mentioning_reports.count
    @report.save
    assert_equal 1, @report.mentioning_reports.count
  end
end
