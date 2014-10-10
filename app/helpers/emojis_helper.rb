module EmojisHelper
  def emoji_tag(emoji, size: 20)
    image_tag("//#{Emoji.image_url_for_name(emoji['name'])}",
              alt: emoji['moji'],
              class: 'emoji',
              width: size,
              height: size)
  end
end
