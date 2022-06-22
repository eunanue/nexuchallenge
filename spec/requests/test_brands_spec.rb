require 'rails_helper'

RSpec.describe 'Brands', type: :request do

  
    describe 'POST /api/v1/brands' do
        context 'with valid parameters' do
          let!(:my_brand) {FactoryBot.create(:brand)} 
        
            before do
              post '/api/v1/brands', params:{ 
                                      name: "Test"
                                    } 
            end


            it 'returns the name' do
              expect(json['name']).to eq("Test")
            end

            it 'returns status code 201' do
              expect(response).to have_http_status(:created)
            end
      end
    end

      
    describe 'POST /api/v1/brands' do
      context 'with valid parameters' do
        let!(:my_brand) {FactoryBot.create(:brand)} 
      
          before do
            post '/api/v1/brands', params:{ 
                                    name: ""
                                  } 
          end


          it 'returns the name' do
            puts json
            expect(json["errors"][0]["title"]).to eq("Name can't be blank")
          end

          it 'returns status code 404' do
            expect(response).to have_http_status(:bad_request)
          end
    end
  end

    describe 'GET /api/v1/brands' do
      before do
        FactoryBot.create_list(:brand, 10)
        get '/api/v1/brands'
      end
      
      it 'returns all brands' do
        total = Brand.count
        expect(json.size).to eq(total)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
  end


end