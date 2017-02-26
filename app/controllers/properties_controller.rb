class PropertiesController < ApplicationController
    #only for testing
    skip_before_action :verify_authenticity_token

    
    def index
        properties = Property.all
        if type = params[:type]
            properties = properties.where(type: type)
        end
        render json: { status: 200, properties: properties}
    end
    
    def create
        property = Property.new(property_params)
        if property.save
            render json: property, status: 200, location: property
        else
            render json: property.errors, status: 400
        end
    end
    
    def destroy
        property = Property.find(params[:id])
        property.destroy!
        render nothing:true, status: 204
    end
    
    def property_params
        params.require(:property).permit(:type, :title, :address, :zipcode, :country, :notes)
    end
end