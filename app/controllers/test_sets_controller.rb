class TestSetsController < ApplicationController

  # def index
  #   @test_sets = current_user.test_sets
  # end

  def new
    @test_set = TestSet.new
  end

  def create
    @test_set = TestSet.new(test_set_params)
    @test_set.user = current_user
    if @test_set.save
      flash[:notice] = "Stay Fresher test set was saved."
    else
      flash.now[:alert] = "Ther was an error saving. Please try again"
      render :new
    end
  end

  def show
    @test_set = TestSet.find(params[:id])
  end

  def edit
    @test_set = TestSet.find(params[:id])
  end

  def update
    @test_set = TestSet.find(params[:id])
    @test_set.assign_attributes(test_set_params)
    if @test_set.save
      flash[:notice] = "Post was updated."
      redirect_to [@test_set]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def destroy
    @test_set= TestSet.find(params[:id])
      if @test_set.destroy
      flash[:notice] = "\"#{@test_set.name}\" was deleted successfully."
      redirect_to account_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def test_set_params
    params.require(:test_set).permit(:name, :subject)
  end
end
