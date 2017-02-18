class MenuController < ApplicationController
  def menu
    @sections = Section.all
    if params[:section_id].present?
      @current_section = Section.find(params[:section_id])
      @food_items = @current_section.food_items
      @is_sorting = 0
    else
      @food_items = FoodItem.all
      @is_sorting = 0
    end

    if params[:sort_column]
      @is_sorting = 1
      @food_items = @food_items.order("#{params[:sort_column]} #{params[:sort_direction]}")
    end
  end
end
