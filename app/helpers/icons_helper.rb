module IconsHelper
  def icon(name, tag: :span)
    content_tag(tag, '', class: "icon-#{name.to_s.gsub('_', '-')}")
  end

  def menu_icon
    ([icon('bar')] * 3).join('').html_safe
  end
end
