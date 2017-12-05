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

  def ts_array
    @test_set = TestSet.find(params[:id])
    @ts_array = @test_set.multiple_choices.sample(params[:number_of_multiple_choices].to_i)
    @ts_array += @test_set.true_falses.sample(params[:number_of_true_falses].to_i)
    @ts_array +=  @test_set.flashcards.sample(params[:number_of_flashcards].to_i)
    @array_answers = @ts_array.map{|ele|
      if ele.class == Flashcard
        1
      elsif ele.class == MultipleChoice
        ele.correct_answer
      elsif ele.class == TrueFalse
        ele.correct_answer
      end
    }
    @user_answers = Array.new(@array_answers.size, params[:user_answer])
  end

  def grading
    @test_set = TestSet.find(params[:id])
    @ts_array 
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  private

  def test_set_params
    params.require(:test_set).permit(:name, :subject)
  end

end
