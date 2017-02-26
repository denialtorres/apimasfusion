class PropertiesController < ApplicationController
    #only for testing
    skip_before_action :verify_authenticity_token
    rescue_from PropertiesController::Exception, :with => :error_render_method
    
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
            render json: { response: false, message: property.errors} , status: 400
        end
    end
    
    def destroy
        property = Property.find(params[:id])
        property.destroy!
        render json: {message: "elemento borrado con exito", property: property}, status: 200
    end
    
    def update
        puts "ESTAS EN UPDATE"
        puts params
        property = Property.find(params[:id])
        
        if property.update(property_params)
            render json: property, status: 200
        else
            render json: { errors: property.errors}, status: 400
        end
    end
    
    def show
        if Property.where(:id => params[:id]).present?
        property = Property.find(params[:id])
        render json: property, status: 200
        else
        puts "ERROR"
        render json: {error: "Elemento no encontrado"}
        end
    end
    
    
    def error_render_method
        render json: {error: "Elemento no encontrado, solo se aceptan type del tipo 'house' o 'deparment'"}, status: 400
    end
    
    def property_params
        params.require(:property).permit(:type, :title, :address, :zipcode, :country, :notes)
    end
end