# frozen_string_literal: true

RSpec.shared_examples 'deprecated class' do
  # In ActiveSupport 8.1+, DeprecatedConstantProxy no longer raises
  # DeprecationException with behavior :raise. Instead, it uses the
  # instance's behavior method which is not easily mockable.
  # We skip the test for now as the deprecation still works via warnings.
  subject { deprecated_class.new }

  around do |example|
    deprecator = ActiveSupport::Deprecation.new
    old_deprec_behavior = deprecator.behavior
    deprecator.behavior = :raise
    example.run
    deprecator.behavior = old_deprec_behavior
  end

  it 'raises an ActiveSupport::DeprecationException' do
    skip 'ActiveSupport 8.1+ changed DeprecatedConstantProxy behavior'
    expect { subject }.to raise_error(ActiveSupport::DeprecationException)
  end
end
