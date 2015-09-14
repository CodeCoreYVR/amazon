class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params
    @product = Product.find params[:product_id]
    @comment.product = @product
    respond_to do |format|
      if @comment.save
        format.html {redirect_to product_path(@product) }
        format.js   { render  }
      else
        format.html {render "/products/show" }
        format.js   { render  }
      end
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@product) }
      format.js   { render }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
