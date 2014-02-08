class TypesController < ApplicationController

  skip_before_filter :authorize


  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end


end