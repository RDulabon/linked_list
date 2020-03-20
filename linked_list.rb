#require "objspace" 
class LinkedList
  attr_accessor :head

  def initialize(value = nil) 
    @head = Node.new(value) 
  end 

  def append(value)
      node = @head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(value) 
  end 

  def prepend(value)
    @head = Node.new(value, @head) 
  end

  def size
    @count = 0
    node = @head
    while (node != nil)
      node = node.next_node
      @count += 1
    end
    puts @count 
  end 

  def head
    puts @head 
  end 

  def tail
    node = @head
    for i in 1...@count do
      node = node.next_node 
    end 
    puts node 
  end

  def at(index)
    node = @head
    for i in 1...index do
      node = node.next_node
    end
    puts node 
  end

  def pop
    node = @head
    while (node != nil)
      if node.next_node.next_node == nil
        node.next_node = nil
      end 
      node = node.next_node
    end
    node
  end

  def contains?(value)
    node = @head
    while node != nil
      if node.value == value
        puts  true
        return
      elsif node.next_node == nil
        puts false 
      end 
    node = node.next_node
    end 
  end 

  def find(value)
    index = 0
    node = @head
    while node != nil
      if node.value == value
        puts index
        return 
      elsif node.next_node == nil
        puts "nil"
      end
      index += 1 
      node = node.next_node
    end
  end

  def to_s
    node = @head
    str = "( #{node.value} ) -> "
    until node.next_node.nil?
      str += "( #{node.next_node.value} ) -> "
      node = node.next_node
    end
    str += 'nil'
  end

  def insert_at(value, index)
    if index == 0 
      prepend(value) 
    else 
      prior = @head
      node = prior.next_node 
      for i in 1...index do
        prior = prior.next_node 
        node = node.next_node
      end 
      prior.next_node = Node.new(value, node) 
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
    else
      prior = @head
      node = prior.next_node
      for i in 1...index do
        prior = prior.next_node
        node = node.next_node
      end 
      prior.next_node = node.next_node 
    end 
  end 
end

class Node
  attr_accessor :value, :next_node 

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end 

  def to_s
    @value
  end
end 

list = LinkedList.new("Micah") 
puts list 
list.append("Gabriel")
puts list 
list.prepend("Carly")
puts list 
list.size 
list.head 
list.tail 
list.at(2)
list.append("Duncan")
list.size
list.pop 
list.size
list.contains?("Gabriel") 
list.contains?("Micah") 
list.contains?("DickButt") 
list.find("Micah")
list.find("Gabriel") 
puts list
list.insert_at("Duncan", 2) 
puts list 
list.remove_at(2) 
puts list 
list.remove_at(0) 
puts list 