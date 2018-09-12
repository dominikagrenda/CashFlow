class AdjustmentsController < ApplicationController
  def create
    adjustment = Adjustment.new(adjustment_params)
    if adjustment.save
      render json: serialize_adjustment(adjustment).serialized_json
    else
      render json: adjustment.errors, status: 400
    end
  end

  def index
    expenses = Adjustment.where(kind: "expense").sum(:value)
    income = Adjustment.where(kind: "income").sum(:value)
    balance = income - expenses
    adjustments = Adjustment.all

    counted_values = {expenses: expenses, income: income, balance: balance}

    payload = serialize_adjustment(adjustments)
      .serializable_hash
      .merge(counted_values)
      .to_json

    render json: payload
  end

  private

  def adjustment_params
    params.require(:adjustment).permit(:value, :name, :kind)
  end

  def serialize_adjustment(adjustment)
    AdjustmentSerializer.new(adjustment.reload)
  end
end
