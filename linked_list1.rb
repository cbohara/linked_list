# builds the nodes of the linked list recursive datatype
class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

# data structure we are using to help us reverse the linked list
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
    # store top node value in variable
    node_value = @data.value
    # overwrite top node with next node in stack AKA pop top node off stack
    @data = @data.next_node
    # return top node value
    return node_value
  end
end

# recursive function prints node values in linked list
def print_values(list_node)          
  if list_node                       
    print "#{list_node.value} --> "   
    print_values(list_node.next_node) 
  else      
    print "nil\n"
    return
  end
end

# NEED TO FIGURE OUT
def reverse_list(list)            # 12 -> 99 -> 37 -> nil
  # create stack 
  stack = Stack.new  
  # loop through linked list and push each node onto the stack
  while list != nil                    
    # push node on to stack
    stack.push(list.value)  
    # jump to next node in original linked list
    list = list.next_node    
  end
  stack.data
end

# building 3 individual nodes and linking them to each other
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2) 


print_values(node3)             # 12 -> 99 -> 37 -> nil
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)           # 37 -> 99 -> 12 -> nil




