module ApplicationHelper
    def resource_name
        :user
    end

    def current_class?(test_path)
        return 'active' if request.path == test_path
        ''
    end
    
    def resource
        @resource ||= User.new
    end
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
end
