class ArticleDecorator < Draper::Decorator
  include Draper::LazyHelpers
  decorates_finders
  delegate_all

  def read_status
    self.read? ? 'Read' : 'Unread'
  end

  def mark_as_read_form_values
    if article.read?
      [false, 'Unread']
    else
      [true, 'Read']
    end
  end
end
