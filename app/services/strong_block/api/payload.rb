#
# Give `listing`, `person`, `transaction`
# Send payload to the StrongBlock API
#
class StrongBlock::Api::Payload
  private

  attr_reader :listing, :person, :transaction

  public

  def initialize(listing, person, transaction)
    @listing = listing
    @person = person
    @transaction = transaction
  end

  def send
    post
  end

  private

  def payload
    {
      payload: {
        chain_id: transaction.chain_id,
        user: person.id
      },
       upload: {
        zip: 'https://marketplace.strongblock.io/listing/123/upload/smart_contract.zip' # Faraday::UploadIO.new(listing.zip, 'application/octet-stream')
      }
    }
  end

  def post
    conn = Faraday.new(APP_CONFIG.strongblock_api_url) do |f|
      f.request :multipart
      f.request :url_encoded
      f.adapter :net_http
    end

    conn.post(APP_CONFIG.strongblock_payload_endpoint, payload)
  end
end
