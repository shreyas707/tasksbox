class ProjectsController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		#check the parameter of status in the url 
		if params[:client_id]
			@projects = current_user.projects.where('client_id = ?', params[:client_id])
		elsif params[:status]
			@projects = current_user.projects.where('status = ?', params[:status])
		else
			@projects = current_user.projects
		end
		#@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to projects_path(@project.id)
		else
			render action: "new"
		end
	end

	def show
		@project = current_user.projects.find(params[:id])
		@task = Task.new
		@completed = @project.tasks.where('is_completed = ?', true)
		@incompleted = @project.tasks.where('is_completed = ?', false)
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = current_user.projects.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to project_path(@project.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@project = current_user.projects.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	private
	def project_params
		params[:project].permit(:client_id, :name, :description, :start_date, :end_date, :estimated_budget, :status, category_ids: [])
	end

end