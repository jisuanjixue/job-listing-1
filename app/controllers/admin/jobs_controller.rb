class Admin::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required

    layout "admin"

    def index
        @jobs = Job.all
        @jobs = @jobs.paginate(:page => params[:page], :per_page => 5)
    end

    def show
        @job = Job.find(params[:id])
    end

    def edit
        @job = Job.find(params[:id])
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def new
        @job = Job.new
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def create
        @job = Job.new(job_params)
        @job.category_id = params[:category_id]
    if @job.save
        redirect_to admin_jobs_path
    else
        render :new
    end
  end

    def update
        @job = Job.find(params[:id])
        @job.category_id = params[:category_id]
      if @job.update(job_params)
        redirect_to admin_jobs_path
    else
        render :edit
    end
  end

   def destroy
       @job = Job.find(params[:id])
       @job.destroy
       redirect_to admin_jobs_path
   end

   def publish
       @job = Job.find(params[:id])
       @job.is_hidden = false
       @job.save
       redirect_to :back
   end

   def hide
       @job = Job.find(params[:id])
       @job.is_hidden = true
       @job.save
       redirect_to :back
   end

    private

    def job_params
     params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :date_of_do, :category_id)
  end


end
