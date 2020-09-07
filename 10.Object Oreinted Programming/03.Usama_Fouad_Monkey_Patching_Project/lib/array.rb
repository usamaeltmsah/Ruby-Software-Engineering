# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    self.max - self.min if self.length > 0
  end

  def average
    self.sum / (1.0 * self.length) if self.length > 0
  end
end
