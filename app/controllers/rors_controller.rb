class RorsController < ApplicationController
  before_action :find_id, only: [:index,:create]
  before_action :get_arrays, only: [:index,:search]
  def index
    # @columnNames = Ror.column_names
    # @columnNames = @columnNames - ["id","created_at","updated_at","language_id"]
    @ror = Ror.new
  end

  def create
    @ror = Ror.new(item_params)
    if @ror.save
      redirect_to root_path
    else
      render :index
    end
  end

  def search
    @rors = Ror.search(params[:keyword])
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
