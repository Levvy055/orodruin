module FaviconHelper
  def favicon(size: nil,
              base: 'favicon',
              rel: 'icon',
              extension: 'png')
    size &&= "#{size}x#{size}"
    basename = [base, size].compact.join('-')

    tag(:link,
        rel: rel,
        type: 'image/png',
        sizes: size,
        href: "/#{basename}.#{extension}")
  end

  def apple_touch_icons(sizes:)
    icons = sizes.map do |size|
      favicon(size: size,
              rel: 'apple-touch-icon',
              base: 'apple-touch-icon')
    end
    icons.join('').html_safe
  end

  def favicons(sizes:)
    icons = sizes.map { |size| favicon(size: size) }
    icons.join('').html_safe
  end

  def windows_tile(color:, image:)
    [
      tag(:meta, name: 'msapplication-TileColor', content: color),
      tag(:meta, name: 'msapplication-TileImage', content: image)
    ].join('').html_safe
  end
end
