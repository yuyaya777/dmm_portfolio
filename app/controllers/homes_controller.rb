class HomesController < ApplicationController

  def top
    @posts = Post.first(3)
  end
end
