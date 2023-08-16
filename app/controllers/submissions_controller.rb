class SubmissionsController < ApplicationController
  before_action :find_submission, only: %i[show]
  before_action :find_quiz, only: %i[create review]

  def show
    @quiz = @submission.quiz
  end

  def create
    # Find the current question
    @question = Question.find(params[:question_id])

    # Check if the answer is correct
    is_correct = @question.correct_answer == params["question_#{@question.id}"].to_i

    # Find an ongoing submission or initialize a new one
    @submission = Submission.find_or_initialize_by(quiz: @quiz, user: current_user)

    # set score to 0 everytime user starts a new submission
    if @question == @quiz.questions.first
      @submission.score = 0
      @submission.completed = false
    end

    # Update score if the answer is correct
    @submission.score += 1 if is_correct

    # Update or add the answer to user_answers
    user_answers = @submission.user_answers || {}
    user_answers[@question.id.to_s] = params["question_#{@question.id}"]
    @submission.user_answers = user_answers

    @submission.save

    # Store the current question ID in the session
    session[:current_question_id] = @question.id

    # Move to the next question or end the quiz
    next_question = @quiz.questions.where("id > ?", @question.id).first

    if next_question
      redirect_to review_quiz_submission_path(@quiz, @submission, next_question_id: next_question.id)
    else
      @submission.update(completed: true)
      redirect_to quiz_submission_path(@quiz, @submission)
    end
  end

  def review
    @submission = Submission.find(params[:id])
    @question = @submission.quiz.questions.find_by(id: session[:current_question_id])
    @next_question_id = params[:next_question_id]
    # Clear the session
    session.delete(:current_question_id)
    @percentage_score = (@submission.score / @quiz.questions.count) * 100
  end

  private

  def find_submission
    @submission = Submission.find(params[:id])
  end

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def submission_params
    params.require(:submission).permit(
      :quiz_id,
      :user_id,
      :score,
      user_answers: {}
    )
  end
end
