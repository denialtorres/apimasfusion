require 'test_helper'

class DeletingPropertiesTest < ActionDispatch::IntegrationTest
  setup do
    @property = Property.create!(type: 0, 
                title: 'Departamento Norte', 
                address: 'Marsella 23, colonia Americana. Guadalajara, Jalisco', 
                zipcode: 44843, 
                country: 'mx', 
                notes: 'Sobre Avenida Juárez')
  end
  
  test 'delete properties' do
    delete "/properties/#{@property.id}"
  end
end
