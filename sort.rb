class Node
  attr_accessor :data, :pointer

  def initialize(data, pointer = nil)
    @data = data
    @pointer = pointer
  end
end

class List
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def add_node(data)
    current_node = @head
    while current_node.pointer != nil
      current_node = current_node.pointer
    end
    new_node = Node.new(data, nil)
    current_node.pointer = new_node
  end

  def sort_list
    current_node = @head
    previous_node = nil
    next_node = nil
    while current_node.pointer != nil
      # locate the next node in the list
      next_node = current_node.pointer
      # store the data values in temporary variables
      current_data = current_node.data
      next_data = next_node.data
      # compare the data values and change pointers if necessary
      if current_data > next_data
        temp = next_node.pointer
        current_node.pointer = temp
      end
      previous_node = current_node
      current_node = next_node
    end
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

list = List.new(1)

10.times do
  list.add_node(rand(10))
end

p "UNSORTED"
list.display
p "SORTED PLEASE"
list.sort_list
list.display
