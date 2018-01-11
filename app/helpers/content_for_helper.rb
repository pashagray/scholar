module ContentForHelper
  def header(text)
    content_for(:header) do
      text
    end
  end

  def links(arr)
    content_for(:links) do
      content_tag(:div, class: 'pull-right') do
        arr.map do |l|
          link_to l[0], l[1], class: 'btn btn-primary'
        end.join(' ').html_safe
      end
    end
  end
end
