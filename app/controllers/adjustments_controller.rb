class AdjustmentsController < ApplicationController
  def create
    adjustment = Adjustment.new(adjustment_params)
    if adjustment.save
      render json: serialize_adjustment(adjustment)
    else
      render json: adjustment.errors, status: 400
    end
  end

  def count_expenses
    expenses = Adjustment.where(kind: "expense")
    if expenses != nil
      render json: serialize_adjustment(expenses)
    else
      render json: expenses.errors, status: 400
    end
  end

  def count_income
    income = Adjustment.where(kind: "income")
    if income != nil
      render json: serialize_adjustment(income)
    else
      render json: income.errors, status: 400
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
