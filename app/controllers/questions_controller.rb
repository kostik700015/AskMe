class QuestionsController < ApplicationController

  before_action :set_question!,  only: [:show, :destroy, :edit, :update]

  def show
    @answer = @question.answers.build
    # @answers = Answer.all.where('question_id=?', @question.id)
    @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(2)
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def edit
  end

  def update 
    if @question.update question_params
      redirect_to questions_path
    else 
      render :new
    end
  end


  def index
    @questions = Question.order(created_at: :desc).page params[:page]
  end 
  def new 
  @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:succes] = "Question created!"
      redirect_to questions_path
    else
      render :new
    end
  end

  private 

  def set_question!
    @question = Question.find_by id: params[:id]
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

end