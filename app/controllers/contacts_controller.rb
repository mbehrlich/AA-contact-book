class ContactsController < ApplicationController
  before_action :get_user, only: [:index, :create, :new, :edit, :update]
  before_action :get_contact, only: [:show, :update, :destroy, :edit]

  def index
    all_contacts = @user.contacts + @user.shared_contacts
    render json: all_contacts
  end

  def show
    render json: @contact
  end

  def create
    contact = @user.contacts.new(contact_params)
    if contact.save
      redirect_to @user
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
  end

  def new
    @contact = Contact.new
  end

  def update
    if @contact.update(contact_params)
      redirect_to @user
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      redirect_to @contact.owner
    else
      render json: @contact.errors.full_messages
    end
  end

  private


  def get_user
    @user = User.find_by(id: params[:user_id])
  end

  def get_contact
    @contact = Contact.find_by(id: params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
