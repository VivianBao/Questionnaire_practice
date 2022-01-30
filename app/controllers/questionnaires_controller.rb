class QuestionnairesController < ApplicationController
  def show
    @questionnaire = Questionnaire.find(params[:id])
    @report = Report.new
    @empty_responses = []
    40.times do
      @empty_responses << Response.new
    end
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    if @questionnaire.save!
      # For testing, redirect to questionnaire made by seeds
      redirect_to questionnaire_path(Questionnaire.all.first)
    else
      redirect_to root_path
    end
  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:reviewer_id, :reviewee_id, :name)
  end
end
