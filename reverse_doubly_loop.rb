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

  def insert_node_at_end(data)
    current_node = @head
    while current_node.next?
      current_node = current_node.get_next_pointer
    end

    new_node = Node.new(data, nil, nil)

    current_node.set_next_pointer(new_node)

    new_node.set_previous_pointer(current_node)
  end

  def reverse_list
    current_node = @head
    previous_node = nil
    next_node = nil

    while current_node
      next_node = current_node.next_pointer
      current_node.set_next_pointer(current_node.get_previous_pointer)
      current_node.set_previous_pointer(current_node.get_next_pointer)

      previous_node = current_node
      current_node = next_node
    end
    @head = previous_node
  end

  def display
    current_node = @head
    while current_node
      p current_node.data
      current_node = current_node.next_pointer
    end
  end
end

list = Doubly_Linked_List.new(1)
(2..10).each {|x| list.insert_node_at_end(x)}
puts "forward!"
list.display
list.reverse_list
puts "reverse!"
list.display
