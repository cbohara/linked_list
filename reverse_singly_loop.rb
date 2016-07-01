class Node
  attr_accessor :data, :pointer

  def initialize(data, pointer = nil)
    # payload value assigned to node
    @data = data
    # memory address of next node in list
    @pointer = pointer
  end
end

class Singly_Linked_List
  def initialize(data)
    @head = Node.new(data, nil)
  end

  # add node to end of list
  def insert_node(data)
    current_node = @head
    # traverse list to find last node
    while current_node.pointer != nil
      current_node = current_node.pointer
    end
    # create new node
    new_node = Node.new(data, nil)
    # reassign last node's pointer from nil to new node at end of list
    current_node.pointer = new_node
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
    # traverse list and print data in each node
    while current_node.pointer != nil
        p current_node.data
        current_node = current_node.pointer
    end
    # don't forget to print the last node's data
    p current_node.data
  end
end

first10 = Singly_Linked_List.new(1)
(2..10).each {|x| first10.insert_node(x)}
first10.display
first10.reverse_list
first10.display
