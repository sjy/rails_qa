# Renders the home page.
class HomeController < ApplicationController
  def index
    @data_records = DataRecord.order(:id).page(params[:page]).per(params[:per_page])
  end
end
