# builds the nodes and connects them into a linked list
class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end
  
  # push a value onto the stack
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end
  
  # pop top item off the stack and return the value to the user
  def pop
    @data = @data.next_node
  end
end

# accepts one node as an argument and prints the list associated with that one node
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end

# NEED TO BUILD
def reverse_list(list)
  # ADD CODE HERE
  stack = Stack.new
  while list
    # ADD CODE HERE
    list = list.next_node
    stack_with_nodes = stack.push(list)
  end
    # while stack
    #   top = stack.pop
    #   reversed = LinkedListNode.new(top, #next_node?)
    # end
  # ADD CODE HERE
  stack_with_nodes
end

# building 3 individual nodes and linking them to each other
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2) 

# accepts the head of the linked list and prints the entire list
print_values(node3)
puts "-------"
# need to build a reverse_list method
revlist = reverse_list(node3)
print_values(revlist)

#reversed = Stack.new # @data = nil
#reversed.push(node1) # @data = LinkedListNode.new(37, nil)
#reversed.push(node2) # @data = LinkedListNode.new(99, LinkedListNode.new(37, nil) )
#reversed.push(node3) # @data = LinkedListNode.new(12, LinkedListNode.new(99, LinkedListNode.new(37, nil) ) )
#reversed.pop         # @data = LinkedListNode.new(99, LinkedListNode.new(37, nil) )
#reversed.pop         # @data = LinkedListNode.new(37, nil)

