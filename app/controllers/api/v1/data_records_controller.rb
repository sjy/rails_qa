class Api::V1::DataRecordsController < ApplicationController
  def index
    @data_records = DataRecord.order(:id).page(params[:page]).per(params[:per_page])
    render json: { data: @data_records.map(&:id), pagination: { total_pages: @data_records.total_pages, current_page: @data_records.current_page } }
  end
end
