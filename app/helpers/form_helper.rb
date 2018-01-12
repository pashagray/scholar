module FormHelper
  def form_field(f, field, type)
    errors = f.object.errors
    content_tag(:div, class: 'form-group') do
      [
        f.label(field),
        FormTypes.new.send(type.to_sym, f, field, errors)
      ].join('').html_safe
    end
  end

  private

  class FormTypes
    def string(f, field, errors)
      f.text_field(field, class: "form-control #{'is-invalid' if errors.any? && errors.include?(field.to_sym)}")
    end

    def integer(f, field, errors)
      f.number_field(field, class: "form-control #{'is-invalid' if errors.any? && errors.include?(field.to_sym)}")
    end

    def date(f, field, errors)
      f.text_field(field, class: "form-control datepicker #{'is-invalid' if errors.any? && errors.include?(field.to_sym)}")
    end

    def file(f, field, errors)
      f.file_field(field, class: "form-control #{'is-invalid' if errors.any? && errors.include?(field.to_sym)}")
    end
  end
end