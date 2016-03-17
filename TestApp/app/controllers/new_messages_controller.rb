class NewMessagesController < ApplicationController
  before_action :set_new_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:new, :create]
  # GET /new_messages
  # GET /new_messages.json
  def index
    @new_messages = NewMessage.all
  end

  # GET /new_messages/1
  # GET /new_messages/1.json
  def show
  end

  # GET /new_messages/new
  def new
    @new_message = NewMessage.new
  end

  # GET /new_messages/1/edit
  def edit
  end

  # POST /new_messages
  # POST /new_messages.json
  def create
    @new_message = NewMessage.new(new_message_params)

    respond_to do |format|
      if @new_message.save
        @user_name = @new_message.user_name
        @user_email = @new_message.user_email
        @user_message = @new_message.user_message
        SiteMailer.new_message(@user_name, @user_email, @user_message).deliver_now
        format.html { redirect_to "/wedding/contact", notice: 'Your message has been sent. Thank you!' }
        format.json { render :show, status: :created, location: @new_message }
      else
        format.html { redirect_to "/wedding/contact", alert: "You must enter your name, email address, and message before sending the message." }
        format.json { render json: @new_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_messages/1
  # PATCH/PUT /new_messages/1.json
  def update
    respond_to do |format|
      if @new_message.update(new_message_params)
        format.html { redirect_to @new_message, notice: 'New message was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_message }
      else
        format.html { render :edit }
        format.json { render json: @new_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_messages/1
  # DELETE /new_messages/1.json
  def destroy
    @new_message.destroy
    respond_to do |format|
      format.html { redirect_to new_messages_url, notice: 'New message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_message
      @new_message = NewMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_message_params
      params.require(:new_message).permit(:user_name, :user_email, :user_message)
    end
end
