class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question_id = @question.id
    if @answer.save
      flash[:notice] = 'Your answer has been added!'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'You must provide a description of at least 50 characters for your answer.'
      redirect_to question_path(@question)
    end
  end

  protected
  def answer_params
    params.require(:answer).permit(:description)
  end

end
