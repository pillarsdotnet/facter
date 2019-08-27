# frozen_string_literal: true

describe 'FactFilter' do
  it 'filters value inside fact' do
    fact_value = { full: '18.7.0', major: '18', minor: 7 }
    searched_fact = Facter::SearchedFact.new('os.release', '', ['major'], fact_value, 'os.release.major')
    Facter::FactFilter.new.filter_facts!([searched_fact])

    expect(searched_fact.value).to eq('18')
  end
end