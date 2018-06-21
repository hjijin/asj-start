module ApplicationHelper
  FLASH_CLASSES = { info: "info", success: "success", warning: "warning", error: "error"}.freeze

  # 页面标题
  def title(page_title='')
    base_title = '心胜OA系统'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def am_title(page_title='')
    base_title = '心胜OA系统'
    page_title.empty? ? base_title : page_title
  end


  def flashes_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end
end
