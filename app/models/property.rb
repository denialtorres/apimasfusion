class Property < ActiveRecord::Base
  enum type: [:house, :deparment]

  validates :type, :presence => {:message => "es obligatorio"}
  
  validates :title, :presence => {:message => "no puede estar en blanco"},
    :length => {:within => 15..45,
                :too_short => 'muy corto, debe ser mayor a 15 caracteres',
                :too_long => 'muy largo, debe ser menor a 45 caracteres'
    }
    
  validates :address, :presence => {:message => "no puede estar en blanco, necesitas una direccion"},
    :length => {:within => 30..140,
                :too_short => 'muy corto, debe ser mayor a 30 caracteres',
                :too_long => 'muy largo, debe ser menor a 140 caracteres'
    }
  validates :zipcode, presence: {:message => " debes introducir un codigo postal"}, 
    :numericality => {:only_integer => true}, length: { is: 5, message: "debe tener un tamaño de 5 numeros" }
    
  validates :country,  :presence => {:message => "no puede estar en blanco, introduce un pais de origen"}, 
    :inclusion => { :in => %w(mx us ca), :message => "no permitido, solo puede ser: mx, us, ca"},
    length: { is: 2, :message => "tiene longitud incorrecta, la longitud debe ser de 2 caracteres" }
  
  validates_length_of :notes, :maximum => 300,
    :message => "debe ser menor o igual a 300 caracteres"
  validates_numericality_of :zipcode,
    :greater_than_or_equal_to => 10000,
    :less_than_or_equal_to => 99999,
    :message => "debe de estar en un rango entre 10000 y 99999"
private
  def self.inheritance_column
    nil
  end
  
end
