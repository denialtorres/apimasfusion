require 'test_helper'

class ListingPropertiesTest < ActionDispatch::IntegrationTest
  setup do
    Property.create!(type: 0, title: 'Departamento en Colonia Americana, Guadalajara', address: 'Marsella 23, colonia Americana. Guadalajara, Jalisco', zipcode: 44843, country: 'MX', notes: 'Sobre Avenida Juárez')
    Property.create!(type: 1, title: 'Departamento Centro', address: 'Calle Nueva 123. Guadalajara, Jalisco', zipcode: 45643, country: 'MX', notes: 'En una esquina')
  end
  
  test 'listing properties' do
    get '/properties'
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Property.count, JSON.parse(response.body).size
  end
  
  test 'list properties type books' do
    get '/properties?type=house'
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1,  JSON.parse(response.body).size
  end  
  
end
