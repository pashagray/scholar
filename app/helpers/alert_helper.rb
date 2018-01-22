module AlertHelper
  def alert_block(level, icon:, text:)
    content_tag(:div, class: "text-center alert alert-#{level.to_s}") do
      [
        content_tag(:h2) do
          fa_icon(icon)
        end,
        content_tag(:p) do
          text
        end,
        ].join('').html_safe
    end
  end
end