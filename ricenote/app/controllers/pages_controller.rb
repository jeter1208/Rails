class PagesController < ApplicationController

  def main
    # render html:"hi" 
    # app/views/pages/main.html.erb  
    # embedded ruby
    @abc = "123"
  end
  def about
  end  
end    