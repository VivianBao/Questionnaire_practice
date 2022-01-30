class PagesController < ApplicationController
  def home
    # To create new questionnaire
    @questionnaire = Questionnaire.new
  end
end
