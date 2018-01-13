module TextHelper
  def text_to_html(text)
    text
      .split(/\r\n/)
      .map { |p| "<p>#{p}</p>" }
      .join('').html_safe
  end
end