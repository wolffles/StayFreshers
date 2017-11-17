class MultipleChoicesController < ApplicationController

  def new
    @test_set = TestSet.find(params[:test_set_id])
    @multiple_choice = @test_set.multiple_choices.build
  end

  def create
    @test_set = TestSet.find(params[:test_set_id])
    @multiple_choice = @test_set.multiple_choices.build(multiple_choice_params)
    if @multiple_choice.save
      flash[:notice] = "Multiple Choice. was saved."
      #nested routes need to supply a few id which is why we need both.
      redirect_to [@test_set, @multiple_choice]
    else
      flash.now[:alert] = "There was an error saving. Please try again"
      render :new
    end
  end

  def show
    @multiple_choice = MultipleChoice.find(params[:id])
  end

  def edit
    @multiple_choice = MultipleChoice.find(params[:id])
  end

  def update
    @multiple_choice = MultipleChoice.find(params[:id])
    @multiple_choice.assign_attributes(multiple_choice_params)
    if @multiple_choice.save
      flash[:notice] = "Post was updated."
      #when using a nested route you this is how you pass the required params to get the uri information right.
      redirect_to [@multiple_choice.test_set, @multiple_choice]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def destroy
    @multiple_choice= MultipleChoice.find(params[:id])
      if @multiple_choice.destroy
      flash[:notice] = "\"#{@multiple_choice.question}\" was deleted successfully."
      redirect_to account_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def multiple_choice_params
    params.require(:multiple_choice).permit(:question, :correct_answer, :a, :b, :c, :d,:test_set_id)
  end
end
