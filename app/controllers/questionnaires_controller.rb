class QuestionnairesController < ApplicationController
  def show

  end

  def create
    redirect_to questionnaire_path(@questionnaire)
  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:reviewer_id, :reviewee_id, :name)
  end
end
