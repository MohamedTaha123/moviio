require 'rails_helper'

RSpec.describe 'Seasons API Requests', type: :request do
  context 'Season Api' do
    before do
      @seasons = FactoryBot.create_list(:season, 3)
      @seasons.each do |season|
        FactoryBot.create_list(:episode, 10, season: season)
      end
      get api_seasons_path
    end

    it 'retrieves the seasons' do
      expect(response).to have_http_status(200)
      expect(json.size).to eq(3)
    end

    it 'retrieves list of seasons ordered by creation DESC' do
      db_ids = @seasons.map(&:id)
      response_ids = json.map { |r| r['id']}
      expect(response_ids).to eq(db_ids.reverse)
    end

    it 'retrieves all the episodes of each season ordered by number' do
      json.each do |season|
        episodes = season['episodes']
        numbers = episodes.map { |e| e['number']}
        expect(numbers).to eq(numbers.sort)
      end
    end
  end
end
