class DataRecordsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def import
    if params[:file].present?
      file = params[:file].path
      CSV.foreach(file, headers: true) do |row|
        # 使用唯一标识符（例如 id）查找现有记录，如果不存在，则初始化一个新记录
        data_record = DataRecord.find_or_initialize_by(name: row['name'])
        # 使用 CSV 文件中的数据更新现有记录或创建新记录
        data_record.update(row.to_hash)
      end
      flash[:notice] = "数据记录已成功更新！"
    else
      flash[:alert] = "请选择一个 CSV 文件！"
    end
    redirect_to root_path
  end
end
