class Model < ApplicationRecord
  belongs_to :brand
  validate :model_name_unique_from_brand


  validates :name,presence: true
  validate :average_price_valid


  def self.validate_brand(params)
    brand = Brand.find_by(:name => params[:brand])
    return brand
  end

  scope :all_models_greater_lower_price, -> (greater,lower){
    find_by_sql([
      "SELECT * FROM models WHERE average_price BETWEEN :lower AND :greater",
      {greater: greater, lower: lower}
    ])
  }


  private

  def average_price_valid
    if average_price < 100000
      return errors.add(:average_price, 'cannot be lower that 100000')
    end
  end

  def model_name_unique_from_brand
      if (Model.where(:name=>self.name).count() > 0)
        return errors.add(:name, 'Modelo ya existe')
      end
  end

end
