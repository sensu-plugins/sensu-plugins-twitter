lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'

require_relative 'lib/sensu-plugins-twitter'

Gem::Specification.new do |s|
  s.authors                = ['Sensu Plugins and contributors']

  s.date                   = Date.today.to_s
  s.description            = 'Sensu plugins for twitter'
  s.email                  = '<sensu-users@googlegroups.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  s.homepage               = 'https://github.com/sensu-plugins/sensu-plugins-twitter'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer'         => '',
                               'development_status' => 'unmaintained',
                               'production_status'  => 'unstable - testing reccomended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-plugins-twitter'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.3.0'

  s.summary                = 'Sensu plugins for twitter'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsTwitter::Version::VER_STRING

  s.add_runtime_dependency 'sensu-plugin', '>= 3', '< 5'
  s.add_runtime_dependency 'twitter',      '6.2.0'

  s.add_development_dependency 'bundler',                   '~> 1.7'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  s.add_development_dependency 'github-markup',             '~> 3.0'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 12.3'
  s.add_development_dependency 'rdoc',                      '~> 6.0'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rspec',                     '~> 3.4'
  s.add_development_dependency 'rubocop',                   '~> 0.60.0'
  s.add_development_dependency 'yard',                      '~> 0.9.11'
end
