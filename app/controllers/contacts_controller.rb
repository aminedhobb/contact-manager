class ContactsController < ApplicationController
  before_action :set_page, only: [:index]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.order(id: :desc).limit(@contacts_per_page).offset(@page * @contacts_per_page)
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
    @contact.update(contact_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :tag_list)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_page
    case params[:commit]
    when "Next"
      @page = params[:page].to_i + 1
    when "Previous"
      @page = params[:page].to_i - 1
    else
      @page = 0
    end
    @contacts_per_page = (params[:contacts_per_page].nil? ? 10 : params[:contacts_per_page].to_i)
  end

end
