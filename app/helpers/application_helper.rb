module ApplicationHelper
  def time_calculator_index
    split_values = @duration.split
    hrs  = 0
    mins = 0
    if split_values.length == 4
      hrs  = split_values[0].to_i
      mins = split_values[2].to_i
      hrs_in_secs  = hrs * 60 * 60 * 2
      mins_in_secs = mins * 60 * 2
      hrs_in_secs + mins_in_secs * 365
    else
      mins = split_values[0].to_i
      mins * 60 * 2 * 365
    end
  end
end
