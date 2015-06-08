class Error::NotFoundPresenter < Curly::Presenter
  def cry
    video_tag('404.webm', autoplay: true, loop: true, controls: false)
  end
end
