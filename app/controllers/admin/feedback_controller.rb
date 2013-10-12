class Admin::FeedbackController < ApplicationController
  layout 'admin'
  before_action :request_login
  before_action :set_feedback, only: [:edit, :show, :update, :destroy]



  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to [:admin, @feedback], notice: "feedback created!"
    else
      render :new
      flash[:warning] = "please fix the errors"
    end
  end

  def show
    #set_feedback
    #@feedback = Feedback.find(params[:id])
  end

  def edit
    #set_feedback
    #@feedback = Feedback.find(params[:id])
  end

  def update
    #set_feedback
    #@feedback = Feedback.find(params[:id])
    if @feedback.update(feedback_params)
      redirect_to [:admin, @feedback], notice: "update done!"
    else
      render :edit
      flash[:warning] = "please fix the errors "
    end
  end

  def destroy
    #set_feedback
    #@feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to admin_feedback_index_path, notice:  "feedback was deleted!"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :is_active,:comment, :pro, :contra)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning]  = "Feedback : #{@feedback.name} could not be found"
    redirect_to admin_feedback_index_path
  end


end