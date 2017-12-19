class CustomersController < ApplicationController

  require 'responders'
  respond_to :pdf
  respond_to :haml

  def index
    @customers = Customer.all

    respond_to do |format|
      format.haml
      format.pdf do
        render pdf: 'REPORT 1',
               template: 'customers/index.pdf.erb'
      end
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit!
  end

end
