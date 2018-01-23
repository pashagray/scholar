module FormatHelper

  def data_set(obj, m, type)
    content_tag(:div, class: 'data-set') do
      [
        content_tag(:p) do
          content_tag(:small) do
            obj.class.human_attribute_name(m.to_sym)
          end
        end,
        content_tag(:p) do
          content_tag(:b) do
            format_by_type(value: obj.send(m), type: type)
          end
        end
      ].join('').html_safe
    end
  end

  def format_by_type(value:, type:)
    if value.blank?
      '–'
    else
      FormatTypes.new.send(type.to_sym, value)
    end
  end

  class FormatTypes
    def string(value)
      value.to_s
    end

    def integer(value)
      value.to_s
    end

    def iin(value)
      value
    end

    def date(value)
      value.strftime('%d.%m.%Y')
    end

    def datetime(value)
      value.strftime('%d.%m.%Y %H:%M')
    end

    def time(value)
      value.in_time_zone('Almaty').strftime('%H:%M')
    end
  end
end