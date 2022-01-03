class SkillsController < ApplicationController
  
  def search
    @result = params[:name].empty? ? [] : Tag.search(params[:name])

    respond_to do |format|
      format.json { render json: @result }
    end
  end
end