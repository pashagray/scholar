class AvatarGenerator
  def call
    "http://api.adorable.io/avatar/200/#{(0...8).map { (65 + rand(26)).chr }.join}"
  end
end