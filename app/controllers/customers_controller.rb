class CustomersController < ApplicationController
  layout :resolve_layout
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  #before_filter :confirm_logged_in, only: [:index, :edit, :destroy]

  # GET /customers


  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  def index
    @customers = Customer.all
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.build_user
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        UserMailer.activation_email(@customer.user).deliver_now
        format.html { redirect_to home_path, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_path, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :dob, :gender, :contact, user_attributes: [ :username, :email, :password,:password_confirmation])
  end

  def resolve_layout
    case action_name
      when "index","edit"
        "admin"
      when "new", "create"
        "register"
      else
        "application"
    end
  end
end
