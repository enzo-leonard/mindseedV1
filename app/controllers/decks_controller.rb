class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  # before_action :use_unsafe_params, only: [:import]

  # GET /decks
  # GET /decks.json
  def index
    @theme = Theme.find(params[:theme_id])
    @decks = Deck.all.where(theme: @theme)
  end

  # GET /decks/search
  def search
    @sql = 'name ILike?', "%#{params[:query]}%"
    @childs = []
    @decks = Deck.where(@sql)

    @decks.each do |deck|
      @childs << deck if deck.childs.count.zero?
    end
    @cards = Card.all
    @deck = Deck.new
    gon.cards = @cards
    @all_decks = Deck.all
    gon.decks = @all_decks
    @all_themes = Theme.where(user: current_user)
    gon.themes = @all_themes
    @user = current_user.id
    gon.user = @user

    @cards.each do |card|
      p card
    end

    @sql_for_import = Deck.joins(:theme).where(themes: {user: current_user})

    @theme = Theme.new
    # import_deck
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    @theme = @deck.theme
  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json

  def create
    @theme = Theme.find(params[:theme_id])
    @deck = Deck.new(deck_params)
    @deck.original_owner = true

    @deck.theme = @theme
    @parent = Deck.find(params[:deck][:parent_id])
    @deck.rank = @parent.rank+1


    if @deck.save
      respond_to do |format|
        format.js { }# <-- will render `app/views/decks/create.js.erb`
      end
    else
      respond_to do |format|
        format.js { }  # <-- idem
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    @deck = Deck.find(params[:deck_id])

    args = { rank: @deck.rank, name: @deck.name, description: @deck.description, is_private: true, theme_id: @deck.theme_id}
    @deck2 = Deck.new(args)
    @deck2.theme.user = current_user
    @deck2.save
    @assign_cards_to_deck = []
    @deck.cards.each do |card|
      @args = {
        term: card.term,
        definition: card.definition,
        context: card.context,
        photo: card.photo,
        memo: card.memo
      }
      carte = Card.new(@args)
      @assign_cards_to_deck << carte
    end
    @assign_cards_to_deck.each do |card|
      card.deck_id = @deck2.id
      card.save
    end
    @theme = Theme.find(params[:deck][:theme_id])

    @deck2.save

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:vitality, :rank, :name, :description, :theme_id, :stars, :is_private, :parent_id, :photo)
    end

  end
