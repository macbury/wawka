module Wawka
  class Harvest
    include HTTParty
    base_uri 'https://api.harvestapp.com'

    def time_entries(from:, to:, page: 1)
      self.class.get('/v2/time_entries', headers: headers, query: { from: from, to: to, per_page: 100, page: page })
    end

    private

    def headers
      {
        'Authorization' => 'Bearer ' + Wawka.config.dig('harvest', 'token'),
        'Harvest-Account-Id' => Wawka.config.dig('harvest', 'account_id').to_s,
        'User-Agent' => 'KakaDemona'
      }
    end
  end

end
