module FaviconHelper
  def apple_touch_favicon(size: nil,
                          base: 'apple-touch-icon',
                          extension: 'png')
    size &&= "#{size}x#{size}"
    basename = [base, size].compact.join('-')

    tag(:link,
        rel: 'apple-touch-icon',
        sizes: size,
        href: "/#{basename}.#{extension}")
  end

  def favicon(size: nil,
              base: 'favicon',
              extension: 'png')
    size &&= "#{size}x#{size}"
    basename = [base, sizes].compact.join('-')

    tag(:link,
        rel: 'icon',
        type: 'image/png',
        sizes: size,
        href: "/#{basename}.#{extension}")
  end

  def apple_touch_favicons(sizes:, base: 'apple-touch-icon')
    icons = sizes.map { |size| apple_touch_favicon(size: size, base: base) }
    icons.join('').html_safe
  end

  def favicons(sizes:, base: 'favicon')
    icons = sizes.map { |size| favicon(size: size, base: base) }
    icons.join('').html_safe
  end

  def windows_tile(color:, image:)
    [
      tag(:meta, name: 'msapplication-TileColor', content: color),
      tag(:meta, name: 'msapplication-TileImage', content: image)
    ].join('').html_safe
  end
end
