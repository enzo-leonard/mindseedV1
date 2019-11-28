class ThemesController < ApplicationController
  before_action :set_Theme, only: [:show, :edit, :update, :destroy, :mind_map]
  def index
    @themes = Theme.all
    @data = {}
    @themes.each do |theme|
      @data[theme.name] = {nb_car: card_theme(theme),  vitality: theme.vitality ? theme.vitality : 0}
    end
    @data_test = {
      "theme1" =>  {nb_card: 0, vitality: 90},
      "theme2" =>  {nb_card: 10, vitality: 50},
      "theme3" =>  {nb_card: 45, vitality: 100},
      "theme4" => {nb_card: 100, vitality: 10},
      "theme5" =>  {nb_card: 89, vitality: 60},
      "theme6" => {nb_card: 70, vitality: 10},
      "theme7" =>  {nb_card: 0, vitality: 60}
    }
  end
  def show
    @decks_originel = []
    @array_map = []
    @theme.decks.each do |item|
      @decks_originel << item if item.rank == 1
      @array_map << item
    end
     @map = mind_map()
  end
  def new
    @theme = Theme.new
  end
  def learn
    @theme = Theme.find(params[:id])
    @cards = []
    7.times do @cards
    @cards << Card.all.sample
    end
  end
  def edit
  end
  def create
    @theme = Theme.new(theme_params)
    @user = current_user
    @theme.user = @user
    if @theme.save!
      respond_to do |format|
        format.js# <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- idem
      end
    end
  end
  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme, notice: "Theme was successfully updated." }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :edit }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to theme_url, notice: "Theme was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params.require(:theme).permit(:vitality, :rank, :name, :description, :theme_id, :stars, :is_private, :parent_id)
    end
    def card_child(array, done, count)
      array.each do |item|
        if !done.include?(item)
          count += item.cards.count
          card_child(item.childs, done, count) if item.childs
        end
        end
        count
    end
    def card_theme(theme)
      done = []
      count = 0
      count += card_child(theme.decks, done, count)
    end
    def show_child(array, done)
      childrens = []
      array.each do |item|
        if !done.include?(item.name)
          hash = { name: item.name, rank: item.rank, card_nb: item.cards.count }
          hash[:size] = item.cards.count if item.childs.count == 0
          hash[:deck_id] = item.id if item.childs.count == 0
          hash[:children] = show_child(item.childs, done)
          done << item.name
          childrens << hash
        end
      end
        childrens
    end
    def mind_map()
      done = []
      array = @theme.decks
      map4 = {
        name: @theme.name,
        rank: 0,
        children: show_child(array, done)
      }
      map4.to_json
    end
  # Use callbacks to share common setup or constraints between actions.
  def set_Theme
    @theme = Theme.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
end
