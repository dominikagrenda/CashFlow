class AdjustmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :value, :name, :kind
end
