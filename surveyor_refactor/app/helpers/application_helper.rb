module ApplicationHelper

  def field_with_errors(object, field)
    if object.errors[field].empty?
      error = ""
    else
      error = field.to_s.titleize + ": " + object.errors[field].first
    end
  end

end

