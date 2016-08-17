class ClientsController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@clients = current_user.is_admin? ? Client.all : current_user.clients 

		#lists clients that belong to the user who has signed in
		#@clients = current_user.clients

		#lists all clients
		#@clients = Client.all
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		#start - inserts user id(primary key) into clients table, user_id row(foreign key).
		@client.user_id = current_user.id
		#end
		if @client.save
			redirect_to clients_path
		else
			render action: "new"
		end
	end

	def show
		#exception handling
		begin
			@client = current_user.clients.find(params[:id])
			#@client = Client.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path, notice: "Record not found."
		end
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = current_user.clients.find(params[:id])
		#@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@client = current_user.clients.find(params[:id])
		#@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_path
	end

	private
	def client_params
		params[:client].permit(:name, :company, :email, :mobile)
	end

end