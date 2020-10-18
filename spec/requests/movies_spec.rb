require 'rails_helper'

RSpec.describe 'Movies Api Requests', type: :request do
  context ' Movie Api' do
    # make HTTP get request before each example
    before do
      @movies = FactoryBot.create_list(:movie, 10)
      get api_movies_path
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'retrieves the movies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    # it_behaves_like "paginated_array"

    it 'retrieves list of movies ordered by creation DESC' do
      data_ids = @movies.map(&:id)
      response_ids = json.map { |r| r['id']}
      expect(response_ids).to eq(data_ids.reverse)
    end
  end
end
