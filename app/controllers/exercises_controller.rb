class ExercisesController < OpenReadController
  before_action :set_exercise, only: [:update, :destroy]

  # GET /exercises
  # GET /exercises.json
  def index
    if params[:user] == 'current'
      p current_user
      @exercises = current_user.exercises
    else
      @exercises = Exercise.all
    end
    render json: @exercises
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    render json: @exercise
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = current_user.exercises.build(exercise_params)

    if @exercise.save
      render json: @exercise, status: :created, location: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    @exercise = current_user.exercises.find(params[:id])

    if @exercise.update(exercise_params)
      head :no_content
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy

    head :no_content
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
    @exercise = current_user.exercises.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:category, :name, :description, :duration,
                                     :user_id, :done)
  end
end
