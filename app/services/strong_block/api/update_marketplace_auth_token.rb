class StrongBlock::Api::UpdateMarketplaceAuthToken
  private

  attr_reader :listing, :transaction

  public

  def initialize(person)
    @person = person
  end

  def send
    post
  end

  private

  def payload
    {
      'person': {
        'id': "#{person.id}",
        'auth_token': "#{person.auth_token}"
      }
    }
  end

  def post
    RestClient.post("#{APP_CONFIG.strongblock_api_url}#{APP_CONFIG.strongblock_update_marketplace_auth_token_endpoint}", payload.to_json, content_type: :json)
  end
end
