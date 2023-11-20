class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new(list: @list)
    @bookmark = Bookmark.new

    # @movie = Movie.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@lists)
    else
      render :new, status: :unprocessable_entity
    end
    # respond_to do |format|
      # if @list.save
      #   format.html { redirect_to lists_url, notice: "list was successfully created." }
      #   format.json { render :show, status: :created, location: @list }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @list.errors, status: :unprocessable_entity }
      # end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
