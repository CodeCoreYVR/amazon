class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params
    @product = Product.find params[:product_id]
    @comment.product = @product
    if @comment.save
      redirect_to product_path(@product)
    else
      render "/products/show"
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to product_path(@product)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
