class SayController < ApplicationController
  
  def hello
  end

  def goodbye
  end

  def products
  	@products = ["Marker", "Pencil", "Box", "Sketch Pen"]
  end

  def assignments
  end

end
