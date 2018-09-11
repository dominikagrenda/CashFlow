class AdjustmentsController < ApplicationController
  def create
    adjustment = Adjustment.new(adjustment_params)
    if adjustment.save
      render json: serialize_adjustment(adjustment)
    else
      render json: adjustment.errors, status: 400
    end
  end

  private

  def adjustment_params
    params.require(:adjustment).permit(:value, :name, :kind)
  end

  def serialize_adjustment(adjustment)
    AdjustmentSerializer.new(adjustment.reload).serialized_json
  end
end
