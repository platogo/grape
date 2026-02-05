# frozen_string_literal: true

describe Grape::Xml do
  it 'uses multi_xml' do
    skip 'MultiXml is not available' unless Object.const_defined?(:MultiXml)
    expect(described_class).to eq(::MultiXml)
  end
end
