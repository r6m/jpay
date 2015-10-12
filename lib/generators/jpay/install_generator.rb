require 'rails/generators/base'

module Jpay
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Jpay initializer for your application"

      def copy_initializer
        template "jpay_initializer.rb", "config/initializers/jpay.rb"
        # puts "add your Jahanpay 'api' to config/initializers/jpay.rb"
        # puts "add 'callback_url' to config/initializers/jpay.rb"
        puts "Install complete!"

      end
    end
  end
end