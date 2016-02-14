class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase

    case type
    when "todo"
      @items.push TodoItem.new(description, options)
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "Invalid item type: #{type}."
    end
  end
  def delete(index)
    if index > @items.length || index < 0
      raise UdaciListErrors::IndexExceedsListSize, "No item at: #{index} (out of range)."
    end
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length if @title
    puts @title
    puts "-" * @title.length if @title
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
