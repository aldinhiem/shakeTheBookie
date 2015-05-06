class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      flash[:success] = 'Thank You, we will respond shortly.'
      redirect_to new_contact_path
    else
      flash[:danger] = 'Something went wrong! please ensure name and email fields are filled in'
      redirect_to new_contact_path
    end
      
  end
  
  
  private
  
  def contact_params
    params.require(:contact).permit(:name,:email,:comments)
  end
end