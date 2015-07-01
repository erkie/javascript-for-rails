module MvcCoffee
  module Rails
    class Engine < ::Rails::Engine
    	config.assets.paths << File.expand_path('../../../../', __FILE__)
    end
  end
end
