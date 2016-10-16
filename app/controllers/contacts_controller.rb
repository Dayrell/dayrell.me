class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    
    if @contact.deliver
      flash[:success] = "Mensagem enviada"
      render 'pages/index'
    else
      flash[:error] = "Please check registration errors"
      render 'new'
    end
  end
end
