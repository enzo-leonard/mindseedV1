
class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :addVitality]

  def index
  end

  def show
  end

  def new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @card = Card.new(card_params)
    @card.deck = @deck
    @theme = @deck.theme
    if @card.save!
        respond_to do |format|
          format.html { render partial: 'decks/form_update', locals: { card: @card, deck: @deck} }
          format.js{ render 'create'}# <-- will render `app/views/reviews/create.js.erb`
      end

    else
      respond_to do |format|
        format.js{}  # <-- idem
      end
    end
  end

  def edit
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
    if @card.update!(card_params)
      respond_to do |format|
        format.js{ render 'update' }  # <-- idem
      end
    else
      render 'decks/show'
    end
  end

  def addVitality
    @card = Card.find(params[:id])
    @card.vitality += 50 if @card.vitality < 100;
    if @card.save!
      respond_to do |format|
        format.html{ 'done' }  # <-- idem
      end
    else
      render 'decks/show'
    end
  end

  def delete
  end

  private

  def card_params
    params.require(:card).permit(:term, :definition, :photo, :context, :memo)
  end
end
