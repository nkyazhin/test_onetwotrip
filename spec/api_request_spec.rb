require 'json'

RSpec.describe 'suggestRequest' do
  let(:uri)    { 'https://www.onetwotrip.com/_hotels/api/suggestRequest' }

  it 'availability check' do
    code, json = get_response(uri: uri)
    expect(code).to eq('200')
    expect(json['result']).to eq([])
    expect(json['error']).to eq(nil)
  end

  private

  def get_response(uri: '', hash_params: {})
    params = URI.encode_www_form(hash_params)
    uri = URI("#{uri}?#{params}")
    response = Net::HTTP.get_response uri
    json = JSON.parse response.body
    [response.code, json]
  end

end