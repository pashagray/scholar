module SearchFormHelper
  def search_form_field(f, field, type)
    content_tag(:div, class: 'form-group') do
      [
        SearchFormTypes.new.send(type.to_sym, f, field)
      ].join('').html_safe
    end
  end

  private

  class SearchFormTypes
    def iin(f, field)
      f.text_field("#{field}_cont", class: 'form-control')
    end

    def string(f, field)
      f.text_field("#{field}_cont", class: 'form-control')
    end

    def integer(f, field)
      f.number_field("#{field}_eq", class: 'form-control')
    end

    def date(f, field)
      f.text_field("#{field}_eq", class: 'form-control')
    end
  end
end