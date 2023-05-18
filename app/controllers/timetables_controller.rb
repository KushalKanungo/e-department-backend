class TimetablesController < ApplicationController
  before_action :set_timetable, only: %i[ show update destroy ]

  # GET /timetables
  def index
     # debugger
    sleep 2
    @timetables = Timetable.order(Arel.sql("CASE WHEN date >= '#{Date.today}' THEN 0 ELSE 1 END, CASE WHEN date >= '#{Date.today}' THEN date END ASC, CASE WHEN date < '#{Date.today}' THEN date END DESC"))
    if params[:query]
      query = params[:query]
      @timetables = @timetables.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%")
    end
    if params[:semester]
      @timetables = @timetables.where(semester: params[:semester])
    end
    @timetables = @timetables.page(params[:page] || 1).per(12)

    render json: { timeTables: @timetables, total_count: @timetables.total_count },  status: :ok

  end

  # GET /timetables/1
  def show
    render json: @timetable
  end

  # POST /timetables
  def create
    @timetable = Timetable.new(timetable_params)

    if @timetable.save
      render json: @timetable, status: :created, location: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timetables/1
  def update
    if @timetable.update(timetable_params)
      render json: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timetables/1
  def destroy
    @timetable.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timetable_params
      params.require(:timetable).permit(:semester, :title, :description, :date, :url, :active)
    end
end
