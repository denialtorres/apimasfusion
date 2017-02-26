require 'test_helper'

class ViewOnePropertyTest < ActionDispatch::IntegrationTest
  setup do
    @property = Property.create!(
                type: 0, 
                title: 'Departamento Norte', 
                address: 'Marsella 23, colonia Americana. Guadalajara, Jalisco', 
                zipcode: 44843, 
                country: 'mx', 
                notes: 'Sobre Avenida Juárez')
  end
  
  test 'update properties' do
    get "/properties/#{@property.id}"
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
