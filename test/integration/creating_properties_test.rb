require 'test_helper'

class CreatingPropertiesTest < ActionDispatch::IntegrationTest
  test 'creates new properties with valid data' do
    post '/properties', { property: {
      type: 0,
      title: 'Casa en renta por colonias salvarcar',
      address: 'Calle Siempre Alegre 213, por donde venden naranjas',
      zipcode: 12345,
      country: 'mx',
      notes: 'Casi llegando a la esquina'
    } }.to_json, 
    { 'Accept' => 'application/json', 
    'Content-Type' => 'application/json' }
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    property = json(response.body)
    assert_equal property_url(property[:id]), response.location
    
    assert_equal 'house', property[:type]
    assert_equal 'Casa en renta por colonias salvarcar', property[:title]
    
  end
  
  test 'does not create properties with invalid data' do
      post '/properties', { property: {
      type: 0,
      title: nil,
      address: 'Calle Siempre Alegre 213',
      zipcode: 12345,
      country: 'mx',
      notes: 'Casi llegando a la esquina'
    } }.to_json, 
    { 'Accept' => 'application/json', 
    'Content-Type' => 'application/json' }
    
    assert_equal 400, response.status
  end
end
