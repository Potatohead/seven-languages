class Tree
  attr_accessor :children, :node_name

  def initialize(structure)
    @node_name = "root";
    @children = [];

    if structure.size == 1
      @node_name = structure.keys()[0]
      structure = structure.values()[0]
    end

    structure.each_pair { |child_name, child_structure|
     @children.push(Tree.new({child_name => child_structure}))
    }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

#--------------------------------------------------
# ruby_tree = Tree.new( "Ruby",
#                      [Tree.new("Reia"),
#                        Tree.new("MacRuby")])
# 
# puts "Visiting a node"
# ruby_tree.visit{|node| puts node.node_name}
# puts
# 
# puts "visiting entire tree"
# ruby_tree.visit_all {|node| puts node.node_name}
#-------------------------------------------------- 

hash_tree = Tree.new(
  {"grandpa" => 
    {"dad" => 
      {"child 1" => {}, 
       "child 2" => {} }, 
     "uncle" => 
      {"child 3" => {}, 
       "child 4" => {} } } })

puts "Visiting a node"
hash_tree.visit{|node| puts node.node_name}
puts

puts "visiting entire tree"
hash_tree.visit_all {|node| puts node.node_name}
