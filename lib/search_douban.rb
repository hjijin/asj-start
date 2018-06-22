# 抓取豆瓣图书信息
# 豆瓣API: https://developers.douban.com/wiki/?title=book_v2

require 'httparty'

module SearchDouban
  class << self
    # 根据关键字在豆瓣获取书籍
    # @params
    #    q---关键字
    def search_list(keyword)
      url = "https://api.douban.com/v2/book/search"
      options = { query: { q: keyword, count: 10 } }
      response = HTTParty.get(url, options)
      JSON.parse(response.body)
    end


    def search(book_id)
      url = "https://api.douban.com/v2/book/#{book_id}"
      response = HTTParty.get(url)
      JSON.parse(response.body)
    end
  end
end