module ApplicationHelper
  def render_li_for(record)
    name = record.class.name.downcase

    content_tag_for :li, record do
      render "#{name.pluralize}/#{name}"
    end
  end
end
