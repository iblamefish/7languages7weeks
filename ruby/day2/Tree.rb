# original tree
class Tree
	attr_accessor :children, :node_name

	def initialize(name, children=[])
		@children = children
		@node_name = name
	end

	def visit_all(&block)
		visit &block
		children.each { |c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end



# modified to accept a hash
class Tree2
	attr_accessor :children, :node_name

	def initialize(name, children=[])
		if name.is_a? Hash
			name.each_pair do | key, value |
				@node_name = key
				@children = []
				value.each do | item |
					@children.push Tree2.new({item[0] => item[1]})
				end
			end
		else
			@children = children
			@node_name = name
		end
	end

	def visit_all(&block)
		visit &block
		children.each { |c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

# more readable version
class Tree3
	attr_accessor :children, :node_name

	def initialize(name, children=[])
		init_from_hash( name) if name.is_a? Hash 
		init_from_array(name, children) if name.is_a? String
	end
	
	def init_from_hash( hash)
		hash.each_pair do | name, children |
			@node_name = name
			@children = []
			children.each do | item |
				@children.push Tree2.new({item[0] => item[1]})
			end
		end
	end

	def init_from_array( name, children=[])
		@children = children
		@node_name = name
	end

	def visit_all(&block)
		visit &block
		children.each { |c| c.visit_all &block }
	end

	def visit (&block)
		block.call self
	end
end


ruby_tree = Tree2.new( "Ruby", [Tree.new("Reia"), Tree.new( "MacRuby")]);

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


puts '-----------'



ruby_tree2 = Tree2.new({
		'grandpa' => { 
			'dad' => {
				'child1' => {},
				'child2' => {}
			},
			'uncle' => {
				'child3' => {},
				'child4' => {}
			}
		}
	});

puts "Visiting a node"
ruby_tree2.visit {|node| puts node.node_name}

puts "visiting entire tree"
ruby_tree2.visit_all {|node| puts node.node_name}




puts '-----------'



ruby_tree3 = Tree3.new({
		'grandpa' => { 
			'dad' => {
				'child1' => {},
				'child2' => {}
			},
			'uncle' => {
				'child3' => {},
				'child4' => {}
			}
		}
	});

puts "Visiting a node"
ruby_tree3.visit {|node| puts node.node_name}

puts "visiting entire tree"
ruby_tree3.visit_all {|node| puts node.node_name}
