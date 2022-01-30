class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    if @report.save!
      # For testing, redirect to questionnaire made by seeds
      redirect_to root_path
    else
      #for testing reasons
      redirect_to questionnaire_path(Questionnaire.all.first)
    end

    def report_params
      params.require(:report).permit(:questionnaire_id)
    end
  end
end
