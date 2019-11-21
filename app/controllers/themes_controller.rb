class ThemesController < ApplicationController
  before_action :set_Theme, only: [:show, :edit, :update, :destroy, :mind_map]

  def index
    @themes = Theme.all
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
    @cards = []
    7.times do @cards
    @cards << Card.all.sample
    end
  end

  def edit
  end

  def create
    @theme = Theme.new(Theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: "Theme was successfully created." }
        format.json { render :show, status: :created, location: @theme }
      else
        format.html { render :new }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @theme.update(Theme_params)
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
    def Theme_params
      params.require(:Theme).permit(:vitality, :rank, :name, :description, :theme_id, :stars, :is_private, :parent_id)
    end


    def show_child(array, done)

      childrens = []

      array.each do |item|
        if !done.include?(item.name)
          hash = { name: item.name, children: show_child(item.childs, done) }
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
        name: 'theme',
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



