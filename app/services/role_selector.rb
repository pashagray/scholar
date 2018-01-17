class RoleSelector
  include Wisper::Publisher

  def call(roles)
    if roles.size > 1
      broadcast(:multirole)
    elsif roles.size.zero?
      broadcast(:none)
    else
      broadcast(roles.first.to_sym)
    end
  end
end
