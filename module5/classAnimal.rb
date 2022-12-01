class Birds                     
  MESS = "System error : override voice method"
  attr_accessor :no_of_legs, :isWild, :color, :weight
  def initialize(habitat, isWild, color, weight)      #constructor
    @habitat = habitat
    @isWild = isWild
    @color = color
    @weight = weight
  end

  def voice; raise MESS; end                        #make override compulsory if not on call it will raise an error    

  def can_fly?                                           
    puts "Ofcourse birds can fly"
  end
end

class Eagle < Birds                                 #Eagle inherited from Birds class
  attr_accessor :type
  def initialize(habitat, isWild, color, weight, type)
    super(habitat, isWild, color, weight)
    @type = type
  end

  def to_s                                          #override to_s method
    "Eagle => Habitat : #{@habitat}, Is Wild : #{@isWild}, Color : #{color}, Weight : #{@weight}, Type : #{@type}" 
  end

  def voice                                         #override voice method
    puts "Peal Call"
  end
end

class Penguine < Birds                          #Penguine inherited from Birds class
  attr_accessor :type
  def initialize(habitat, isWild, color, weight, type)
    super(habitat, isWild, color, weight)
    @type = type
  end

  def voice                                     #override voice method
    puts "squawk"
  end

  def to_s                                      #override to_s mothod
    "Eagle => Habitat : #{@habitat}, Is Wild : #{@isWild}, Color : #{color}, Weight : #{@weight}, Type : #{@type}" 
  end
end

eagle = Eagle.new("Forests",true,"Brown",22,"Golden")
eagle.voice
eagle.can_fly?
puts eagle

penguine = Penguine.new("Sea",false,"Black and White",60,"African")
def penguine.can_fly?                                  #singleton method will have different implementation only for this object
  puts "No penguines can't fly but they can swim"
end
penguine.can_fly?
penguine.voice
puts penguine
