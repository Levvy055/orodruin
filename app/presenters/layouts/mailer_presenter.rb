class Layouts::MailerPresenter < Curly::Presenter
  def content
    yield
  end
end
