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
    params.require(:ror).permit(:gem_name, :about_gem,:syntax_name,:version,:how_to_use,:description,:reference_url).merge(language_id: 1)
  end

  def find_id
    @rors = Language.find(1).rors
  end

  def get_arrays
    @columns = ["gemファイル名","gemfileに記載する内容","構文名","バージョン","使い方","記載場所","参考URL"]
  end
end
