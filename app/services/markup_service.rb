require 'pipeline'
require 'filters/emoji_filter'
require 'filters/markdown_filter'

# Public: Return text parsed using any Lightweight Markup Language. Current
# implementation use Markdown (by Redcarpet gem).
#
# Parser flags enabled:
#
#   - `autolink`
#   - `quote`
#
# Renderer flags enabled:
#
#   - `no_styles`
#   - `safe_link_only`
#   - `with_toc_data`
#
# Example:
#
#     parser = MarkupService.new
#
#     parser.call('Lorem ipsum') #=> '<p>Lorem ipsum</p>'
class MarkupService
  PIPELINE = Pipeline.new [
    MarkdownFilter.new,
    EmojiFilter.new
  ]

  def initialize(content)
    @content = content.to_s
  end

  # Parse given text.
  #
  # Returns parsed text.
  def call
    PIPELINE.call(@content)
  end
end
