module ApplicationHelper
  def auto_links(str)
    str = link_hashtag(str)
    str = link_mentions(str)
    str.html_safe
  end

  def link_hashtag(str)
    str.gsub(/#(\w+)/, "<a href='/hashtags/\\1'>#\\1</a>")
  end

  def link_mentions(str)
    str.gsub(/@(\w+)/, "<a href='/\\1'>@\\1</a>")
  end

  def time_since_creation(dt)
    if dt > Time.now.beginning_of_day
      str = "#{time_ago_in_words(dt).gsub('about', '')} ago"
    else
      str = dt.strftime("%b %d, %Y")
    end
    str
  end
end
