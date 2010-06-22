class String < Object
  
  def short
    self.max_length(11)
  end
  
  def max_length(length)
    if self.length > length
      if self.is_german_umlaut?(length)
        self.slice(0...length) + "."
        
      elsif self.is_space(length - 2)
        self.slice(0...length - 2) + "..."
      else
        self.slice(0...length - 1) + "."
      end
    else
      self
    end
  end

  def is_german_umlaut?(position)
    self[position .. position + 1] == 'ä' or self[position .. position + 1] == 'ö' or self[position .. position + 1] == 'ü'
  end
  
  def is_space(position)
    self[position] == 32
  end
end