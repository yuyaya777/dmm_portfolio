class SearchController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = Post.search_for(@content, @method)
  end
end
