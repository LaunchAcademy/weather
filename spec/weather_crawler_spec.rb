require 'rspec'

require_relative '../lib/weather'

describe Weather::Report do
  it 'gets a weather report' do
    report = Weather::Report.new('02210')
    report.retrieve
    expect(report.temperature).to_not be_nil
    expect(report.conditions).to_not be_nil
  end
end
