# coding: utf-8
class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]

    case @priority
    when "high", "medium", "low", "", nil
    else
      raise UdaciListErrors::InvalidPriorityValue, "Not a valid priority: #{@priority}."
    end
    
  end
  
  def details
    format_description(@description) + "due: " +
    format_date(start_date: @due) +
    format_priority(@priority)
  end
end
