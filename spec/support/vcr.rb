require 'vcr'
require 'webmock/rspec'
require 'base64'

WebMock.disable_net_connect!

VCR.configure do |c|
  c.default_cassette_options = {
    serialize_with: :json,
    record: ENV['TRAVIS'] ? :none : :once
  }
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  c.filter_sensitive_data('<GITHUB_LOGIN>') { test_github_login }
  c.filter_sensitive_data('<GITHUB_TEST_ORGANISATION>') { test_github_org }
  c.filter_sensitive_data('<<ACCESS_TOKEN>>') { test_github_token }
end

def test_github_login
  ENV.fetch 'OCTOKIT_TEST_GITHUB_LOGIN', 'codaset-user-test'
end

def test_github_token
  ENV.fetch 'OCTOKIT_TEST_GITHUB_TOKEN', 'x' * 40
end

def test_github_org
  ENV.fetch 'OCTOKIT_TEST_GITHUB_ORGANISATION', 'codaset-org-test'
end
