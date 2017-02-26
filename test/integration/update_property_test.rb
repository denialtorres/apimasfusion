require 'test_helper'

class UpdatePropertyTest < ActionDispatch::IntegrationTest
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
    patch "/properties/#{@property.id}", { property: {
      type: 0,
      title: 'Casa en renta por colonias salvarcar',
      address: 'Calle Siempre Alegre 213, por donde venden naranjas',
      zipcode: 12345,
      country: 'mx',
      notes: 'Casi llegando a la esquina'
    } }.to_json, 
    { 'Accept' => 'application/json', 
    'Content-Type' => 'application/json' }
    
    property = json(response.body)
    assert_equal "Casa en renta por colonias salvarcar", property[:title]
    
  end
end
