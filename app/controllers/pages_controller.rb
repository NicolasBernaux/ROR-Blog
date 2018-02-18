class PagesController < ApplicationController


  def index
    @posts = Post.all
    require 'open-uri'
    require 'json'

    @content = URI("https://newsapi.org/v2/top-headlines?sources=abc-news&apiKey=dd1a011b861d44118163582bc4df2195").read
    @content = JSON.parse(@content)
  endcale =  params[:locale]
  end
end