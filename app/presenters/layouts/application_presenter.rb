class Layouts::ApplicationPresenter < Curly::Presenter
  def stylesheets
    stylesheet_link_tag('application',
                        media: 'all',
                        'data-turbolinks-track' => true)
  end

  def javascripts
    javascript_include_tag('application',
                           'data-turbolinks-track' => true)
  end

  def csrf
    csrf_meta_tags
  end

  def body
    yield
  end

  def navigation
    render 'components/navigation'
  end

  def icons
    [
      apple_touch_icons(sizes: [57, 72, 60, 76, 114, 120, 144, 152]),
      favicons(sizes: [16, 32, 96, 160, 196]),
      windows_tile(color: '#da532c', image: '/mstile-144x144.png')
    ].join('').html_safe
  end
end
