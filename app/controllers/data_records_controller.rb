class DataRecordsController < ApplicationController
  def index
    @data_records = Rails.cache.fetch("data_records", expires_in: 5.minutes) do
      # DataRecord.order(:id).page(params[:page]).per(params[:per_page])
      DataRecord.all
    end
  end

  def show
    @data_record = DataRecord.find(params[:id])
  end

  def edit
    @data_record = DataRecord.find(params[:id])
    authorize @data_record, policy_class: DataRecordPolicy
  end

  def update
    @data_record = DataRecord.find(params[:id])
    authorize @data_record
    if @data_record.update(data_record_params)
      flash[:notice] = "数据记录已成功更新！"
      DeleteCacheJob.perform_later("data_records")
      redirect_to root_path
    else
      flash.now[:alert] = "更新失败，请检查输入！"
      render :edit
    end
  end

  def destroy
    @data_record = DataRecord.find(params[:id])
    authorize @data_record

    if @data_record.destroy
      flash[:notice] = "数据记录已成功删除！"
      DeleteCacheJob.perform_later("data_records")
    else
      flash[:notice] = "存在关联的数据没有删除，请先处理"
    end
    redirect_to root_path
  end

  def data_record_params
    params.require(:data_record).permit(:name, :value)
    # ... 其他属性 ...
  end

  def import
    if params[:file].present?
      file = params[:file].path
      CSV.foreach(file, headers: true) do |row|
        # 使用唯一标识符（例如 id）查找现有记录，如果不存在，则初始化一个新记录
        data_record = DataRecord.find_or_initialize_by(name: row["name"])
        # 使用 CSV 文件中的数据更新现有记录或创建新记录
        data_record.update(row.to_hash)
        DeleteCacheJob.perform_later("data_records")
      end
      flash[:notice] = "数据记录已成功更新！"
    else
      flash[:alert] = "请选择一个 CSV 文件！"
    end
    redirect_to root_path
  end

end
