class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, previous=nil)     # list 12 -> 99 -> 37 -> nil
  # store current_head value
  current_head = list.next_node
  # change the current nodes next link to previous node (initially nil)
  list.next_node = previous
  # if the current_head does not equal nil, utilize recursive reverse_list
  if current_head
    # set the current node to be the next node until the node value is nil
    reverse_list(current_head, list)
  else
    # return reversed list
    list
  end
end

node1 = Node.new(37)
node2 = Node.new(99, node1)
node3 = Node.new(12, node2)

print_values(node3)
print_reverse = reverse_list(node3)
print_values(print_reverse)
