class MarkdownFilter
  attr_accessor :options

  def initialize(renderer: {}, parser: {})
    @render_opts = renderer.reverse_merge(safe_link_only: true,
                                          with_toc_data: true,
                                          no_styles: true)
    @parse_opts = parser.reverse_merge(autolink: true,
                                       quote: true,
                                       tables: true,
                                       underline: true,
                                       highlight: true,
                                       footnotes: true)
  end

  def parse(text)
    parser.render(text)
  end

  private

  def renderer
    @render ||= Redcarpet::Render::HTML.new(@render_opts)
  end

  def parser
    @parser ||= Redcarpet::Markdown.new(renderer, @parse_opts)
  end
end
