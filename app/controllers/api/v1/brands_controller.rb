class Api::V1::BrandsController < Api::ApiController

    def index
        @brands = Brand.all
        render json:  @brands, status: :ok

    end

    def create
        brand = Brand.create(brand_params)
        if brand.save
            render json: brand, status: :created
          else
            render json: ErrorSerializer.serialize(brand.errors), status: :bad_request
        end
    end

    private

    def brand_params
        params.permit(:name)
    end

    def set_brand
		@brand = Brand.new
	end

end