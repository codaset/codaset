class CardsController < ApplicationController
  before_action :set_account
  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards
  def index
    @cards = Card.all
  end

  # GET /cards/new
  def new
    @card = current_user.owned_cards.build(accountable: @account)
  end

  # POST /cards
  def create
    @card = current_user.owned_cards.build(card_params)
    @card.accountable = @account

    if @card.save
      redirect_to @card, notice: 'Card was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      redirect_to @card, notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
    redirect_to cards_url(@account.to_param), notice: 'Card was successfully destroyed.'
  end

  private

    def set_account
      @account = Account.find_by(username: params[:account_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @account.cards.find_by(number: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:title, :description)
    end
end
