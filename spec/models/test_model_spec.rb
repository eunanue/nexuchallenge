require 'rails_helper'
require 'spec_helper'

RSpec.describe Model, :type => :model do
    
    brand = Brand.create(:name => 'Doe')

    model_uno =  
        Model.new(name: "PRueba",
                            brand_id: brand.id,
                            created_at: DateTime.now,
                            updated_at: DateTime.now + 1.week,
                            average_price: 500000)
    model_dos =  
    Model.new(name: "PRueba 2",
                        brand_id: 2,
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week,
                        average_price: 500000)
    
    model_tres =  
    Model.new(name: "",
                        brand_id: 1,
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week,
                        average_price: 500000)
    

    model_cuatro =  
    Model.new(name: "TEST 4",
                        brand_id: 1,
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week,
                        average_price: 3000)

    it "is valid with valid attributes" do
        expect(model_uno).to be_valid
    end


    it "Brand doesnt exist" do
        expect(model_dos).to_not be_valid
    end

    it "is not valid without a name" do
        expect(model_tres).to_not be_valid
    end

    it "avera_price wrong," do
        expect(model_cuatro).to_not be_valid
    end
end