class ListsController < ApplicationController
  def new
    @list = List.new
  end
  def create
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])  
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
     list = List.find(params[:id])
     list.update(list_params)
     redirect_to list_path(list.id)
  end
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
# params
# formから送られてくるデータはparamsの中に入っています。
# require
# 送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。
# permit
# requireで絞り込んだデータの中から、保存を許可するカラムを指定します。