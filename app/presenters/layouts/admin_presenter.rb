class Layouts::AdminPresenter < Curly::Presenter
  def stylesheets(file: 'admin/application', media: 'all')
    stylesheet_link_tag(file,
                        media: media,
                        'data-turbolinks-track' => true)
  end

  def javascripts
    [
      javascript_include_tag('admin/application')
    ].join("\n").html_safe
  end

  def icons
    [
      apple_touch_icons(sizes: [57, 72, 60, 76, 114, 120, 144, 152]),
      favicons(sizes: [16, 32, 96, 160, 196]),
      windows_tile(color: '#da532c', image: '/mstile-144x144.png')
    ].join('').html_safe
  end

  def locale
    I18n.locale
  end

  def user_id
    current_user.id
  end

  def body
    yield
  end
end
