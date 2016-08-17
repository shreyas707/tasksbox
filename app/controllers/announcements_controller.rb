class AnnouncementsController < ApplicationController

	def index
		@announcements = Announcement.all
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.user_id = current_user.id
		if @announcement.save
			Notification.announce(@announcement, current_user).deliver!
			redirect_to announcements_path(@announcement.id)
		else
			render action: "new"
		end
	end

	def show
		@announcement = current_user.announcements.find(params[:id])
	end

	def edit
		@announcement = Announcement.find(params[:id])
	end	

	def update
		@announcement = current_user.announcements.find(params[:id])
		if @announcement.update_attributes(announcement_params)
			redirect_to announcement_path(@announcement.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end
	
	def destroy
		@announcement = current_user.announcements.find(params[:id])
		@announcement.destroy
		redirect_to announcements_path
	end

	private
	def announcement_params
		params[:announcement].permit(:title, :body, user_ids: [])
	end

end
