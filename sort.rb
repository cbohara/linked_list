class Node
  attr_accessor :data, :pointer

  def initialize(data, pointer = nil)
    # payload value assigned to node
    @data = data
    # memory address of next node in list
    @pointer = pointer
  end
end

class List
  def initialize(data)
    @head = Node.new(data, nil)
  end

  # add node to end of list
  def add_node(data)
    current_node = @head
    # traverse list to find last node
    while current_node.pointer != nil
      current_node = current_node.pointer
    end
    # create new node
    newNode = Node.new(data, nil)
    # reassign last node's pointer from nil to new node at end of list
    current_node.pointer = newNode
  end

  def reverse_list
    current_node = @head
    previous_node = nil
    next_node = nil
    while current_node.pointer != nil
      # store memory address of next node in order to not lose the rest of the list
      next_node = current_node.pointer
      # assign the current node to point to previous node's memory address
      current_node.pointer = previous_node
      # previous_node will now be reassigned to the current_node's address in order to traverse the list
      previous_node = current_node
      # current_node will now be reassigned to the next_node's address in order to traverse the list
      current_node = next_node
    end
    @head = previous_node
  end

  def display
    current_node = @head
    while current_node.pointer != nil
        p current_node.data
        current_node = current_node.pointer
    end
    p current_node.data
  end
end

long_list = List.new(1)

1000.times do
  long_list.add_node(rand(1000))
end

long_list.display
