class Node
  attr_reader :data, :prev_pointer, :next_pointer

  def initialize(data, previous_pointer = nil, next_pointer = nil)
    @data = data
    @previous_pointer = previous_pointer
    @next_pointer = next_pointer
  end

  def set_pointer(node)
    @pointer = node
  end

  def get_pointer
    @pointer
  end

  def next?
    !@next_pointer.nil?
  end
end

class Doubly_Linked_List
  def initialize(data)
    @head = Node.new(data, nil, nil)
  end

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
  def insert_node_at_tail(data)
    current_node = @head
    # traverse the list
    while current_node.next_pointer != nil
      current_node = current_node.next_pointer
    end
    # create new node to insert
    new_node = Node.new(data, nil, nil)
    # point the last node to the new node
    current_node.next_pointer = new_node
    # point the new node to the last node
    new_node.prev_pointer = current_node
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

(2..10).each {|x| list.insert_node_at_tail(x)}

list.display
list.reverse_list
p "REVERSE"
list.display
