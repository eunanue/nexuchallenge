class BrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_price

  def average_price
      (object.models.sum(:average_price) / object.models.count).round(2)
  end
  
end
