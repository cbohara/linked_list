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

  # NEED HELP MAKING STACK POP TO REVERSE LIST WORK
  while (current_value = stack.pop) != nil                   # 37
    first_node = LinkedListNode.new(current_value, nil)      # 37 -> nil
    second_node = LinkedListNode.new(stack.pop, nil)         # 99 -> nil
    first_node.next_node = second_node                       # 37 -> 99 -> nil
  end
end

# building 3 individual nodes and linking them to each other
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2) 


print_values(node3)             # 12 -> 99 -> 37 -> nil
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)           # 37 -> 99 -> 12 -> nil


  #   # pop off top value in stack
  #   while (current_value = stack.pop) != nil
  #     # create first node in reversed linked list
  #     first_node = LinkedListNode.new(current_value, nil)
  #     # create second node in reversed linked list with current top value of stack
  #     second_node = LinkedListNode.new(stack.pop, nil)
  #     # point the first node in reversed linked list to the second node
  #     first_node.next_node = second_node
  #   end 
  # end


  # only want to use stack.pop once per loop
  # current node of 37 points to nothing
  # previous rest of the list not set inside the loop, set up before loop
  #top = LinkedListNode.new(stack.pop, nil)      # 37 -> nil
  #middle = LinkedListNode.new(stack.pop, nil)   # 99 -> nil
  # loop through stack and pop each node value into the reversed linked list


    #top = LinkedListNode.new(stack.pop, nil)  # 37 -> nil
    #middle = LinkedListNode.new(stack.pop, nil)  # 99 -> nil
    #top.next_node = middle   # 37 -> 99 -> nil
    # now middle = top




