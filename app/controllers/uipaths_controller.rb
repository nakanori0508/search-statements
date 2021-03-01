class UipathsController < ApplicationController
  before_action :find_id, only: [:index,:create]
  before_action :get_arrays, only: [:index,:search]

  def index
    @uipath = Uipath.new
  end

  def create
    @uipath = Uipath.new(item_params)
    if @uipath.save
      redirect_to root_path
    else
      render :index
    end
  end

  def search
    @uipaths = Uipath.search(params[:keyword])
  end


  private
  def item_params
    params.require(:uipath).permit(:package_name, :activity_name,:variable_type,:version,:how_to_use,:description,:reference_url).merge(language_id: 3)
  end

  def find_id
    @uipaths = Language.find(3).uipaths
  end

  def get_arrays
    @columns = ["package名","Activity名","変数名","バージョン","使い方","記載場所","参考URL"]
  end
end
