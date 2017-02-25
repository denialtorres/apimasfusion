class PropertiesController < ApplicationController
    def index
        properties = Property.all
        render json: properties, status: 200
    end
end