class ResponsesController < ApplicationController

  def create
    @response = Response.new(response_params)
    if @response.save!
      redirect_to root_path
    else
      # For testing, redirect to questionnaire made by seeds
      redirect_to questionnaire_path(Questionnaire.all.first)
    end
  end

  private
  def questionnaire_params
    params.require(:response).permit(:response_text)
  end
end
