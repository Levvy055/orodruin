class EmojiFilter
  include ActionView::Helpers
  include EmojisHelper

  def initialize(options = {})
    @options = options
    @index = Emoji::Index.new
  end

  def parse(raw)
    %i(unicode images).reduce(raw) do |text, method|
      send(method, text)
    end
  end

  private

  def images(text)
    @index ||= Emoji::Index.new

    text.gsub(/:(\w+):/) do |match|
      if (emoji = @index.find_by_name(Regexp.last_match[1]))
        emoji_tag(emoji)
      else
        match
      end
    end
  end

  def unicode(text)
    Emoji.replace_unicode_moji_with_images(text)
  end
end
