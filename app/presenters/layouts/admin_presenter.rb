class Layouts::AdminPresenter < Curly::Presenter
  def js
    [
      javascript_include_tag('admin/application')
    ].join("\n").html_safe
  end

  def body
    yield
  end
end
