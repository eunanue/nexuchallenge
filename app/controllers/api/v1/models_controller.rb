class Api::V1::ModelsController < Api::ApiController


    before_action :set_brand, only: [ :index, :create ]
    before_action :set_model, only: [ :update ]

    def index
        @models = @brand.models.all
        render json: @models, status: :ok
    end

    def create
        @model = @brand.models.build(model_params)
        if @model.save
            render json: @model, status: :created
          else
            render json: ErrorSerializer.serialize(@model.errors), status: :bad_request
        end
    end

    def update
        @model.update(model_params_update)
        if @model.save
            render json: @model, status: :ok
          else
            render json: ErrorSerializer.serialize(@model.errors), status: :bad_request
        end
    end

    def search
        greater = params[:greater]
        lower = params[:lower]
        @models = Model.all_models_greater_lower_price(greater,lower)
        render json: @models, status: :ok
    end
    
    private

    def model_params
        params.permit(:name,
                      :average_price)
    end
    
    def model_params_update
        params.permit(:average_price)
    end
    
    def set_brand
        @brand = Brand.find(params[:brand_id])
    end

    def set_model
        @model = Model.find(params[:id])
    end

end
