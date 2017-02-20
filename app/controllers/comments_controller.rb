class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @comment = @food_item.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to food_item_path(id: @food_item.id), notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to food_item_path(id: @food_item.id), notice: 'Comment was unsuccessfully posted. Missing field!' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food_item = FoodItem.find(params[:food_item_id])
    @comment = @food_item.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to food_item_path(id: @food_item.id), notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :body, :rating)
    end
end
