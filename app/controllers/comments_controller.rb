class CommentsController < ApplicationController
  def create
    p_hash = {}
    if params[:comment_id]
      # subcomment
      p_hash[:parent_comment_id] = params[:comment_id]
      params.merge!(p_hash)
    end
    
  end

  def show

  end
end
