class ContestsController < ApplicationController
  before_action :set_contest, only: %i[ show update destroy ]

  # GET /contests
  def index
    # debugger
    sleep 1
    @contests = Contest.order(Arel.sql("CASE WHEN date >= '#{Date.today}' THEN 0 ELSE 1 END, CASE WHEN date >= '#{Date.today}' THEN date END ASC, CASE WHEN date < '#{Date.today}' THEN date END DESC"))
    if params[:query]
      query = params[:query]
      @contests = @contests.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%")
    end
    @contests = @contests.page(params[:page] || 1).per(12)
    @total_count = @contests.total_count
    # render json: { contests: @contests, total_count: @contests.total_count },  status: :ok
  end

  # GET /contests/1
  def show
    render json: @contest
  end

  # POST /contests
  def create
    @contest = Contest.new(contest_params)

    if @contest.save
      render json: @contest, status: :created, location: @contest
    else
      render json: @contest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contests/1
  def update
    if @contest.update(contest_params)
      render json: @contest
    else
      render json: @contest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contests/1
  def destroy
    @contest.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contest_params
      params.require(:contest).permit(:title, :date, :description, :url, :active)
    end
end
