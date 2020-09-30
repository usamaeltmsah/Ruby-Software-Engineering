class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        @value.inspect
    end

    def parent=(parent)
        @parent.children.delete(self) if !@parent.nil?
        @parent = parent
        return nil if @parent.nil?
        @parent.children << self if !@parent.children.include?(self)
    end
end