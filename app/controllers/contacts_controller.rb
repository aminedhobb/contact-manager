class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def show
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @contact = @contact.update(contact_params)
    redirect_to contact_path(@contact), notice: 'Contact was successfully updated'
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: 'Contact was successfully destroyed'
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :tag_list)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
