class DataRecordRevisionsController < ApplicationController
  def index
    @data_record_revisions = DataRecordRevision.order(:id).page(params[:page]).per(params[:per_page])
  end

  def show
    @data_record = DataRecord.find(params[:data_record_id])
    @data_record_revision = @data_record.data_record_revisions.new
  end

  def create
    @data_record = DataRecord.find(params[:data_record_id])
    @data_record_revision = @data_record.data_record_revisions.new(data_record_revision_params)
    @data_record_revision.user = current_user
    @data_record_revision.pending!

    if @data_record_revision.save
      redirect_to root_path, notice: "Data record revision submitted for review."
    else
      render :new
    end
  end

  def update
    @data_record_revision = DataRecordRevision.find(params[:id])

    if @data_record_revision.update(data_record_revision_params)
      redirect_to root_path, notice: "Data record revision updated."
    else
      render :edit
    end
  end

  def review
    @data_record = DataRecord.find(params[:data_record_id])
    @data_record_revision = DataRecordRevision.find(params[:id])
    authorize @data_record

    if params[:status] == "approved"
      @data_record_revision.approved!
      @data_record.update_from_revision(@data_record_revision)
      flash[:notice] = "Data record revision approved and applied."
    elsif params[:status] == "rejected"
      @data_record_revision.rejected!
      flash[:notice] = "Data record revision rejected."
    else
      flash[:alert] = "Invalid review status."
    end

    redirect_to root_path, notice: "Data record revision review completed."
  end

  def data_record_revision_params
    params.require(:data_record_revision).permit(:change)
  end
end
