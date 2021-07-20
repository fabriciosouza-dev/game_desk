class UserBackoffice::YieldsController < UserBackofficesController
  before_action :set_user_backoffice_yield, only: %i[ show edit update destroy ]

  # GET /user_backoffice/yields or /user_backoffice/yields.json
  def index
    @user_backoffice_yields = UserBackoffice::Yield.eager_load(:submitter).all
  end

  # GET /user_backoffice/yields/1 or /user_backoffice/yields/1.json
  def show
  end

  # GET /user_backoffice/yields/new
  def new
    @user_backoffice_yield = UserBackoffice::Yield.new
  end

  # GET /user_backoffice/yields/1/edit
  def edit
  end

  # POST /user_backoffice/yields or /user_backoffice/yields.json
  def create
    @user_backoffice_yield = UserBackoffice::Yield.new(user_backoffice_yield_params)

    respond_to do |format|
      if @user_backoffice_yield.save
        format.html { redirect_to @user_backoffice_yield, notice: "Yield was successfully created." }
        format.json { render :show, status: :created, location: @user_backoffice_yield }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_backoffice_yield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_backoffice/yields/1 or /user_backoffice/yields/1.json
  def update
    respond_to do |format|
      if @user_backoffice_yield.update(user_backoffice_yield_params)
        format.html { redirect_to @user_backoffice_yield, notice: "Yield was successfully updated." }
        format.json { render :show, status: :ok, location: @user_backoffice_yield }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_backoffice_yield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_backoffice/yields/1 or /user_backoffice/yields/1.json
  def destroy
    @user_backoffice_yield.destroy
    respond_to do |format|
      format.html { redirect_to user_backoffice_yields_url, notice: "Yield was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_backoffice_yield
    @user_backoffice_yield = UserBackoffice::Yield.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_backoffice_yield_params
    params.require(:user_backoffice_yield).permit(:id, :submitter_id, :level, :xp)
  end
end
