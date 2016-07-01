class Node
  attr_accessor :data, :prev_pointer, :next_pointer

  def initialize(data, prev_pointer = nil, next_pointer = nil)
    @data = data
    @prev_pointer = prev_pointer
    @next_pointer = next_pointer
  end
end

class Doubly_Linked_List
  def initialize(data)
    @head = Node.new(data, nil, nil)
  end
  # add node at head of list
  def insert_node_at_head(data)
    current_node = @head
    # create new node to insert
    new_node = Node.new(data, nil, nil)
    # store the head's next pointer value in order to not lose the rest of the list
    temp = current_node.next_pointer
    # point the head node to the new node
    current_node.next_pointer = new_node
    # point the new node to the head node
    new_node.prev_pointer = current_node
    # connect the new node to the next node in the list, if it exists
    if temp != nil
      new_node.next_pointer = temp
    end
  end
  # add node to end of list
  def insert_node_at_tail
    current_node = @head

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
    while current_node.next_pointer != nil
        p current_node.data
        current_node = current_node.next_pointer
    end
    # don't forget to print the last node's data
    p current_node.data
  end
end

list = Doubly_Linked_List.new(1)

9.times do
  list.insert_node_at_head(rand(10))
end

list.display
