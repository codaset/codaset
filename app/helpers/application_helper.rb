module ApplicationHelper
  def page_title_for_head
    if @page_title_for_head
      "#{@page_title_for_head} - Codaset"
    else
      'Codaset - Project management for software developers, that\'s closer to your code'
    end
  end

  def page_title(title_text, head_only: false)
    @page_title_for_head = title_text
    @page_title = head_only ? nil : title_text
  end
end
