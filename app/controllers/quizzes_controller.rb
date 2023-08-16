class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]
  before_action :check_admin, only: %i[new create edit update destroy track_users]


  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
    @submissions = current_user.submissions.where(quiz: @quizzes).index_by(&:quiz_id)
    @percentage_scores = {}
    @submissions.each do |quiz_id, submission|
      quiz = Quiz.find(quiz_id)
      @percentage_scores[quiz_id] = (submission.score / quiz.questions.count) * 100
    end
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  # If a current_question_id is provided, find that question. Otherwise, find the first question of the quiz.
    @current_question = if params[:current_question_id]
                          Question.find(params[:current_question_id])
                        else
                          @quiz.questions.first
                        end
\
    flash[:alert] = "This quiz has no questions." if @current_question.nil?
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
    # create a question without have to add or click add question
    @quiz.questions.build
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def track_users
    @quizzes = Quiz.all
    @users = User.order(:name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(
        :title,
        :image,
        questions_attributes: [
          :id,
          :_destroy,
          :content,
          :answer1,
          :answer2,
          :answer3,
          :answer4,
          :correct_answer,
          :image
        ]
      )
    end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end
end
