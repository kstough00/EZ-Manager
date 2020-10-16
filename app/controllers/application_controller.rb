class ApplicationController < ActionController::Base
    layout "welcome", only: [:home]
    
    def home
        
    end


end