module Delegatable
  include ActiveSupport::Concern

  def method_missing(m, *args, &block)
    assocs = send(:class).reflections.map { |a, b| b.name }
    selected_assocs = assocs.select { |a| m.to_s.start_with?("#{a.to_s}_") }
    if selected_assocs.empty?
      super
    else
      assoc = selected_assocs.last.to_sym
    end
    assoc_m = m.to_s.sub("#{assoc.to_s}_", '').to_sym
    if send(assoc).respond_to?(assoc_m)
      send(assoc).send(assoc_m)
    else
      super
    end
  end
end