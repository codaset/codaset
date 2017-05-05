class CardsController < ApplicationController
  before_action :authenticate_user!, :set_organisation
  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards
  def index
    @cards = @organisation.cards
  end

  # GET /cards/new
  def new
    @card = @organisation.cards.build(creator: current_user)
  end

  # POST /cards
  def create
    @card = @organisation.cards.build(card_params)
    @card.creator = current_user

    if @card.save
      redirect_to card_url, notice: 'Card was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      redirect_to card_url, notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
    redirect_to cards_url(@organisation.to_param), notice: 'Card was successfully destroyed.'
  end

  private

    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_card
      @card = @organisation.cards.find_by(number: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:title, :description)
    end

    def card_url
      organisation_card_url @organisation, @card.number
    end
end
