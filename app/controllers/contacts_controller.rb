class ContactsController < ApplicationController
	before_action :authenticate

	def index
		contacts = @user.contacts
		render json: contacts, status: 200
	end


	def create
		contact = @user.contacts.build(contact_params)
		if contact.save
			render json: contact, status: 201, location: contact
		else
			render json: contact.errors, status: 422
		end
	end

	def update
		contact = @user.contacts.find(params[:id])
		if contact.update(contact_params)
			render json: contact, status: 200
		end
	end

	def destroy
		contact = @user.contacts.find(params[:id])
		contact.destroy
		render nothing: true, status: 204 # or... head 204
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :phone_number, :address)
	end

	protected

	def authenticate_token
		authenticate_with_http_token do |token, options|
			@user = User.find_by(auth_token: token)
		end
	end

	def authenticate
		authenticate_token || render_unauthorized
	end

	def render_unauthorized(realm=nil)
		if realm
			self.headers['WWW-Authenticate'] = %(Token realm="#{realm.gsub(/"/,"")}")
		end
		render json: 'Bad credentials', status: 401
	end
end