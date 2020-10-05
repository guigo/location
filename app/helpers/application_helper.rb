module ApplicationHelper
  def flash_style(type)
    case type.to_sym
    when :error
      'is-danger'
    when :alert
      'is-warning'
    when :notice
      'is-success'
    else
      'is-info'
    end
  end
  
  def formatted_date(date)
    date.strftime('%d/%m/%Y') if date.present?
  end
end
