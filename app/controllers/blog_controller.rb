class BlogController < ApplicationController

  model :user_preferences

  #...

  def index
    render(template: "blog/short_list")
  end
end

def display
  @article = Article.find(params[:id])
end
def add_comment
  @article = Article.find(params[:id])
  comment = Comment.new(params[:comment])
  @article.comments << comment
  if @article.save
    flash[:note] = "Thank you for your valuable comment"
  else
    flash[:note] = "We threw your worthless comment away"
  end
  render(action: 'display')
end

def save
  order = Order.new(params[:order])
  if order.save
    redirect_to action: "display"
  else
    session[:error_count] ||= 0
    session[:error_count] += 1
    if session[:error_count] < 4
      self.notice = "Please try again"
    else
      # Give up -- user is clearly struggling
      redirect_to("/help/order_entry.html")
    end
  end
end

def save_details
  unless params[:are_you_sure] == 'Y'
    redirect_to(:back)
  else
    # ...
  end
end
