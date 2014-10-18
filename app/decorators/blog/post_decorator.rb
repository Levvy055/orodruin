class Blog::PostDecorator < Draper::Decorator
  delegate_all

  def created_at
    h.content_tag :time, datetime: object.created_at.iso8601 do
      object.created_at.strftime('%H:%M %d.%m.%y')
    end
  end
end
