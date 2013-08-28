class ContactsController < ApplicationController
  skip_before_filter :check_logined
  layout 'nav'
  http_basic_authenticate_with name: ENV["CONTACT_NAME"], password: ENV["CONTACT_PASS"], :only => [:index, :show]

  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end


  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @contact }
    end
  end

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html
      format.json { render json: @contact }
    end
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to new_contact_path, notice: '送信しました' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy

  respond_to do |format|
    format.html
    format.json { render json: @contact }
  end
  end
end
