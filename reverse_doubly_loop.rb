class Node
  attr_reader :data, :prev_pointer, :next_pointer

  def initialize(data, previous_pointer = nil, next_pointer = nil)
    @data = data
    @previous_pointer = previous_pointer
    @next_pointer = next_pointer
  end

  def set_next_pointer(node)
    @next_pointer = node
  end

  def set_previous_pointer(node)
    @previous_pointer = node
  end

  def get_next_pointer
    @next_pointer
  end

  def get_previous_pointer
    @previous_pointer
  end

  def next?
    !@next_pointer.nil?
  end
end

class Doubly_Linked_List
  def initialize(data)
    @head = Node.new(data, nil, nil)
  end

  # add node to end of list
  def insert_node_at_end(data)
    current_node = @head
    while current_node.next?
      current_node = current_node.get_next_pointer
    end
    # create new node to insert
    new_node = Node.new(data, nil, nil)
    # point the last node to the new node
    current_node.set_next_pointer(new_node)
    # point the new node to the last node
    new_node.set_previous_pointer(current_node)
  end

  def reverse_list

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

(2..10).each {|x| list.insert_node_at_end(x)}

list.display
