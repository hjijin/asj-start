module ApplicationHelper
  # 页面标题
  def title(page_title='')
    base_title = 'ASJ-START'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def am_title(page_title='')
    base_title = 'ASJ-START'
    page_title.empty? ? base_title : page_title
  end
end
