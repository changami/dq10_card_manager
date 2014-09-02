class LineCardsController < ApplicationController
  before_action :set_line_card, only: [:show, :edit, :update, :destroy]

  # GET /line_cards
  # GET /line_cards.json
  def index
    @line_cards = LineCard.all
  end

  # GET /line_cards/1
  # GET /line_cards/1.json
  def show
  end

  # GET /line_cards/new
  def new
    @line_card = LineCard.new
  end

  # GET /line_cards/1/edit
  def edit
  end

  # POST /line_cards
  # POST /line_cards.json
  def create
    @line_card = LineCard.new(line_card_params)
    @line_card.team = params[:team]
    @line_card.card = params[:card]

    respond_to do |format|
      if @line_card.save
        format.html { redirect_to @line_card, notice: 'Line card was successfully created.' }
        format.json { render :show, status: :created, location: @line_card }
      else
        format.html { render :new }
        format.json { render json: @line_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_cards/1
  # PATCH/PUT /line_cards/1.json
  def update
    respond_to do |format|
      if @line_card.update(line_card_params)
        format.html { redirect_to @line_card, notice: 'Line card was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_card }
      else
        format.html { render :edit }
        format.json { render json: @line_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_cards/1
  # DELETE /line_cards/1.json
  def destroy
    @line_card.destroy
    respond_to do |format|
      format.html { redirect_to line_cards_url, notice: 'Line card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_card
    @line_card = LineCard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_card_params
    params.require(:line_card).permit(:card_id, :team_id)
  end
end
