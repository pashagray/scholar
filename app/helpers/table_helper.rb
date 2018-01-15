module TableHelper
  def configurable_table(collection:, table_handler:, q: nil, nested_in: nil)
    klass = collection.klass
    path = self.controller_path.split('/')
    namespace = path.second ? path.first : nil
    collection.any? ?
    content_tag(:table, class: 'table') do
      [
        content_tag(:tr) do
          table_handler.columns.map do |col|
            content_tag(:th, class: "text-#{col[:align]}") do
              klass.send(:human_attribute_name, col[:name].to_sym)
            end
          end.concat([content_tag(:th, class: 'text-center') { 'Действия' }]).join('').html_safe
        end,
        collection.map do |resourse|
          content_tag(:tr) do
            table_handler.columns.map do |col|
              content_tag(:td, class: "text-#{col[:align]}") do
                format_by_type(value: resourse.send(col[:name].to_sym), type: col[:type])
              end
            end.concat([content_tag(:td, class: 'text-center', style: 'width: 100px;') do 
              [
                link_to([namespace.to_sym, nested_in, resourse].compact, class: 'btn btn-sm btn-secondary') { fa_icon('eye') },
                link_to([:edit, namespace.to_sym, nested_in, resourse].compact, class: 'btn btn-sm btn-secondary') { fa_icon('pencil') } 
              ].join(' ').html_safe
            end])
            .join('').html_safe
          end
        end
      ].join('').html_safe
    end : content_tag(:div, class: 'text-center') {content_tag(:h4) { 'Записей не найдено' } }
  end
end

# link_to [namespace.to_sym, resourse] do
# end