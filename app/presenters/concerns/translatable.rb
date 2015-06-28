module Translatable
  def translate(str)
    I18n.t(str)
  end
end
