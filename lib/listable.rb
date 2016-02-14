# coding: utf-8
module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_date(date_list = {})
    dates = date_list[:start_date] ? date_list[:start_date].strftime("%D") : "No due date"
    dates << " -- " + date_list[:end_date].strftime("%D") if date_list[:end_date]
    dates = "N/A" if date_list.empty? || (self.instance_of?(EventItem) && !date_list[:start_date])
    return dates
  end

  def format_priority(priority)
    case priority
    when "high"
      value = " ⇧"
    when "medium"
      value = " ⇨"
    when "low"
      value = " ⇩"
    when "", nil
      value = ""
    else
      raise UdaciListErrors::InvalidPriorityValue, "Not a valid priority: #{priority}."
    end

    #value = " ⇧" if priority == "high"
    #value = " ⇨" if priority == "medium"
    #value = " ⇩" if priority == "low"
    #value = "" if !priority
    return value
  end
end
