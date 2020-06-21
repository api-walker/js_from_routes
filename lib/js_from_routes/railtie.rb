# frozen_string_literal: true

# NOTE: Not strictly required, but it helps to simplify the setup.
class JsFromRoutes::Railtie < Rails::Railtie
  railtie_name :js_from_routes

  # Allows to automatically trigger code generation after updating routes.
  if Rails.env.development?
    to_prepare do
      JsFromRoutes.generate!(Rails.application)
    end
  end

  # Suitable when triggering code generation manually.
  rake_tasks do
    namespace :js_from_routes do
      desc 'Generates JavaScript files from Rails routes, one file per controller, and one function per route.'
      task generate: :environment do
        JsFromRoutes.generate!(Rails.application)
      end
    end
  end
end
