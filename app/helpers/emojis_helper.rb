module EmojisHelper
  def emoji_tag(emoji, size: 20, css_class: 'emoji')
    image_tag("//#{Emoji.image_url_for_name(emoji['name'])}",
              alt: emoji['moji'],
              class: css_class,
              width: size,
              height: size)
  end
end
