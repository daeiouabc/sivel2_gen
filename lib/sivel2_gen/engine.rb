require 'devise'

module Sivel2Gen
  class Engine < ::Rails::Engine

    isolate_namespace Sivel2Gen

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    # Basado en 
    # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      unless app.root.to_s == root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    # De http://guides.rubyonrails.org/engines.html
#    config.to_prepare do
#      Dir.glob(Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
#        require_dependency(c)
#      end
#      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
#        require_dependency(c)
#      end
#    end
  end

  class << self
    mattr_accessor :titulo
    self.titulo = "Motor de SIVeL genérico " 
  end

  def self.setup(&block)
    yield self
  end

end
