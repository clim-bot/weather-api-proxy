RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure to rerun only failed examples
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Allows the use of 'expect' syntax in tests
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Configures the mock framework
  config.mock_with :rspec do |mocks|
    # Verifies that mocks are properly implemented
    mocks.verify_partial_doubles = true
  end

  # Outputs test run details, useful for debugging
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # By default, RSpec runs tests in random order
  config.order = :random

  # Add global before hooks, useful for general setup (e.g., resetting global state)
  config.before(:suite) do
    puts "RSpec Test Suite Starting..."
  end

  # Allows testing focused on failures or specific examples using :focus
  config.filter_run_when_matching :focus

  # If you'd like RSpec to persist state between test runs (to re-run failed tests), you can use:
  # config.example_status_persistence_file_path = "spec/examples.txt"

  # Profile the 10 slowest examples in the test suite, useful for optimizing performance
  config.profile_examples = 10 if config.files_to_run.one?

  # Allow running just specific examples or groups by using `focus` or similar.
  config.run_all_when_everything_filtered = true

  # Print the 10 slowest tests (useful for debugging performance bottlenecks)
  config.profile_examples = 10
end
