class Node
  attr_reader :data
  attr_reader :pointer
  @data
  @pointer

  def initialize(data, pointer = nil)

    @data = data

    @pointer = pointer
  end

  def setPointer(val)
    @pointer = val
  end

  def next
    @pointer
  end

  def next?
      !@pointer.nil?
  end
end

class Singly_Linked_List
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def insert_node(data)
    current_node = @head

    while current_node.next?
      current_node = current_node.next
    end

    new_node = Node.new(data, nil)

    current_node.setPointer(new_node)
  end

  def reverse_list
    current_node = @head
    previous_node = nil
    next_node = nil
    while current_node.pointer != nil
      next_node = current_node.pointer

      current_node.setPointer(previous_node)

      previous_node = current_node

      current_node = next_node
    end
    @head = previous_node
  end

  def display
    current_node = @head

    while current_node.next?
        p current_node.data
        current_node = current_node.pointer
    end

    p current_node.data
  end
end

first10 = Singly_Linked_List.new(1)
(2..10).each {|x| first10.insert_node(x)}
first10.display
first10.reverse_list
puts "\n!answer:"
first10.display
