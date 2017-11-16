class FlashcardsController < ApplicationController

  def new
    @test_set = TestSet.find(params[:test_set_id])
    @flashcard = @test_set.flashcards.build
  end

  def create
    @test_set = TestSet.find(params[:test_set_id])
    @flashcard = @test_set.flashcards.build(flashcard_params)
    if @flashcard.save
      flash[:notice] = "Flashcard was saved."
      #nested routes need to supply a few id which is why we need both.
      redirect_to [@test_set, @flashcard]
    else
      flash.now[:alert] = "There was an error saving. Please try again"
      render :new
    end
  end

  def show
    @flashcard = Flashcard.find(params[:id])
  end

  def edit
    @flashcard = Flashcard.find(params[:id])
  end

  def update
    @flashcard = Flashcard.find(params[:id])
    @flashcard.assign_attributes(flashcard_params)
    if @flashcard.save
      flash[:notice] = "Post was updated."
      #when using a nested route you this is how you pass the required params to get the uri information right.
      redirect_to [@flashcard.test_set, @flashcard]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def destroy
    @flashcard= Flashcard.find(params[:id])
      if @flashcard.destroy
      flash[:notice] = "\"#{@flashcard.question}\" was deleted successfully."
      redirect_to account_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:question, :description,:test_set_id)
  end
end
