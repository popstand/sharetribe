class StrongBlock::Api::UpdateMarketplaceAuthToken
  private

  attr_reader :listing, :transaction

  public

  def initialize(person)
    @person = person
  end

  def send
    #post
  end

  private

  def payload
    {
      person: {
        id: person.id,
        auth_token: person.auth_token
      }
    }
  end

  def post
    conn = Faraday.new(APP_CONFIG.strongblock_api_url)

    conn.post(APP_CONFIG.strongblock_update_marketplace_auth_token_endpoint, payload, { 'X-Accept' => 'application/json' })
  end
end
