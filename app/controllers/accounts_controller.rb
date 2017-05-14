class AccountsController < ApplicationController
  layout 'dashboard/main'
  before_action :set_account, only: [:show, :edit, :update, :destroy, :sync_reviews]

  # GET /accounts
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
    # @chart_data = {}

    # @account.reviews.each do |r|
    #   @chart_data[r.created_at] = r.rating
    # end
    @chart_data = @account.reviews.group(:created_at).average(:rating)
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  #PATCH/PUT /accounts/1/sync_reviews
  def sync_reviews
  @account.sync_reviews
      redirect_to @account, notice: 'Account was successfully synced.'

  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:name, :slug, :uid, :keywords, :kind, :project_id)
    end
end
