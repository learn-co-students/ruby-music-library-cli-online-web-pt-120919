module Concerns::Findable 
  def find_by_name(name) 
    self.all.find { |thing| thing.name == name }
  end
  
  def find_or_create_by_name(name) 
    if self.find_by_name(name)
      self.find_by_name(name) 
    else
      new_thing = self.create(name) 
    end 
  end
  
end