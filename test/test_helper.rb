$KCODE = 'u' if RUBY_VERSION <= '1.9'

require 'test/unit'
require 'bundler/setup'
require 'i18n'
require 'mocha/setup'
require 'test_declarative'

class Test::Unit::TestCase
  def teardown
    I18n.locale = nil
    I18n.default_locale = :en
    I18n.load_path = []
    I18n.available_locales = nil
    I18n.backend = nil
    I18n.enforce_available_locales = nil
  end

  def translations
    I18n.backend.instance_variable_get(:@translations)
  end

  def store_translations(locale, data)
    I18n.backend.store_translations(locale, data)
  end

  def locales_dir
    File.dirname(__FILE__) + '/test_data/locales'
  end
end

module I18n::Tests
  def self.setup_rufus_tokyo
    require 'rufus/tokyo'
  rescue LoadError => e
    puts "can't use KeyValue backend because: #{e.message}"
  end
end
