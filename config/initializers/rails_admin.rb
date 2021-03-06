# RailsAdmin config file. Generated on March 05, 2014 01:18
# See github.com/sferik/rails_admin for more informations

### Monkey pactch for unscoped records in admin panel
require 'rails_admin/main_controller'
module RailsAdmin
  class MainController
    alias_method :old_get_collection, :get_collection
    alias_method :old_get_object, :get_object

    def get_collection(model_config, scope, pagination)
      if current_user.email=="admin@chitterbot.com"
        old_get_collection(model_config, model_config.abstract_model.model.unscoped, pagination)
      else
        old_get_collection(model_config, model_config.abstract_model.model, pagination)
      end
    end

    def get_object
      if current_user.email=="admin@chitterbot.com"
        raise RailsAdmin::ObjectNotFound unless (object = @abstract_model.model.unscoped.find(params[:id]))
        @object = RailsAdmin::Adapters::ActiveRecord::AbstractObject.new(object)
      else
        raise RailsAdmin::ObjectNotFound unless (object = @abstract_model.model.find(params[:id]))
        @object = RailsAdmin::Adapters::ActiveRecord::AbstractObject.new(object)
      end
    end
  end
end


RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  #config.main_app_name = ['Quizslots', 'Admin']
  # or for a more dynamic name:
  config.main_app_name = Proc.new { |controller| ['SpatialAccess Admin', Client.find_by_subdomain!(request.subdomain).name.titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = []

  # Include specific models (exclude the others):
  config.included_models = ["User","Campaign","Client","Presentation","Slide","PresentationTemplate"]

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:


end
