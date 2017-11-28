class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if params[:preview] || !@note.save
      redirect_to account_path
      # render :action => 'new'
    elsif @note.save
      flash[:notice] = "Your notes have been saved."
      redirect_to @note
    else
      flash.now[:alert] = "There was an error saving. Please try again"
      render :new
    end

  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.assign_attributes(note_params)
    if @note.save
      flash[:notice] = "Post was updated."
      redirect_to [@note]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def destroy
    @note= Note.find(params[:id])
      if @note.destroy
      flash[:notice] = "\"#{@note.subject}\" was deleted successfully."
      redirect_to account_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end



  private

  def note_params
    params.require(:note).permit(:subject, :body, :btn_name)
  end
end
