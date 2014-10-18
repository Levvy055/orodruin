class MarkdownFilter
  attr_accessor :options

  def initialize(renderer: {}, parser: {})
    @render_opts = renderer.reverse_merge(no_styles: true,
                                          safe_link_only: true,
                                          with_toc_data: true)
    @parse_opts = parser.reverse_merge(autolink: true,
                                       quote: true)
  end

  def parse(text)
    parser.render(text)
  end

  private

  def renderer
    Redcarpet::Render::HTML.new(@render_opts)
  end

  def parser
    Redcarpet::Markdown.new(renderer, @parse_opts)
  end
end
