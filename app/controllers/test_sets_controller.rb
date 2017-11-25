class TestSetsController < ApplicationController

  def new
    @test_set = TestSet.new
  end

  def create
    @test_set = TestSet.new(test_set_params)
    @test_set.user = current_user
    if @test_set.save
      flash[:notice] = "Stay Fresher test set was saved."
      redirect_to @test_set
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

  def multiple_choices_test
    @test_set = TestSet.find(params[:id])
    @multiple_choices_array = @test_set.multiple_choices.sample(params[:number_of_cards].to_i)
  end
  def true_falses_test
    @test_set = TestSet.find(params[:id])
    @true_falses_array = @test_set.true_falses.sample(params[:number_of_cards].to_i)
  end
  def flashcards_test
    @test_set = TestSet.find(params[:id])
    @flashcards_array = @test_set.flashcards.sample(params[:number_of_cards].to_i)
  end

  private

  def test_set_params
    params.require(:test_set).permit(:name, :subject)
  end
end
