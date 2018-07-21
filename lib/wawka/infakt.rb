module Wawka
  class InFakt
    include HTTParty
    base_uri 'https://api.infakt.pl/v3'

    def time_entries(from:, to:, page: 1)
      self.class.post('/v2/invoices', headers: headers, query: { from: from, to: to, per_page: 100, page: page })
    end

    private

    def headers
      { 'X-inFakt-ApiKey' => Wawka.config.dig('infakt', 'token') }
    end
  end
end
