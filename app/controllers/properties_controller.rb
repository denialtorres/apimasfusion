class PropertiesController < ApplicationController
    def index
        properties = Property.all
        
        if type = params[:type]
            properties = properties.where(type: type)
        end
        render json: properties, status: 200
    end
end