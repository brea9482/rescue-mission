class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:created_at).page(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Your question has been added!'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'You must provide a name and description for your question.'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = 'Your question has been added!'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'You must provide a name and description for your question.'
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  protected
  def question_params
    params.require(:question).permit(:name, :description)
  end
end
