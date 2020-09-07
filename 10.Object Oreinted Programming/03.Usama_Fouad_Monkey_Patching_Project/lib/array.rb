# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    self.max - self.min if self.length > 0
  end

  def average
    self.sum / (1.0 * self.length) if self.length > 0
  end

  def median
    len = self.length
    sorted = self.sort
    if len > 0
        if len.odd?
            return sorted[len/2]
        else
            return [sorted[(len/2)-1], sorted[len/2]].average
        end
    end
  end
end
