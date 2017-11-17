class TrueFalsesController < ApplicationController

    def new
      @test_set = TestSet.find(params[:test_set_id])
      @true_false = @test_set.true_falses.build
    end

    def create
      @test_set = TestSet.find(params[:test_set_id])
      @true_false = @test_set.true_falses.build(true_false_params)
      if @true_false.save
        flash[:notice] = "true_false was saved."
        #nested routes need to supply a few id which is why we need both.
        redirect_to [@test_set, @true_false]
      else
        flash.now[:alert] = "There was an error saving. Please try again"
        render :new
      end
    end

    def show
      @true_false = TrueFalse.find(params[:id])
    end

    def edit
      @true_false = TrueFalse.find(params[:id])
    end

    def update
      @true_false = TrueFalse.find(params[:id])
      @true_false.assign_attributes(true_false_params)
      if @true_false.save
        flash[:notice] = "Post was updated."
        #when using a nested route you this is how you pass the required params to get the uri information right.
        redirect_to [@true_false.test_set, @true_false]
      else
        flash.now[:alert] = "There was an error saving the post. Please try again."
      end
    end

    def destroy
      @true_false = TrueFalse.find(params[:id])
        if @true_false.destroy
        flash[:notice] = "\"#{@true_false.question}\" was deleted successfully."
        redirect_to account_path
      else
        flash.now[:alert] = "There was an error deleting the post."
        render :show
      end
    end

    private

    def true_false_params
      params.require(:true_false).permit(:question, :correct_answer, :test_set_id)
    end
  end
