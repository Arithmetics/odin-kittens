class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |format|
       format.html
      format.json { render json: @kittens }
    end

  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
       format.html
      format.json { render json: @kitten }
    end

  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Nice you created a kitten"
      redirect_to @kitten
    else
      flash.now[:notice] = "Couldnt create the kitten. Meow"
      render 'new'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "You deleted a kitten, sad!"
    redirect_to root_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten  = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:notice] = "You updated a kitten, wahoo!"
      redirect_to @kitten
    else
      flash.now[:notice] = "issue"
      render 'edit'
    end
  end


  private #########################################3

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end




end
