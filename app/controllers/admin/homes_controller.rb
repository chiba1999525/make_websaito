class Admin::HomesController < ApplicationController

  #ログイン済みのアクセス
  before_action :authenticate_admin!
  def top
  end
end
