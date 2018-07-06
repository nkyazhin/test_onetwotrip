RSpec.describe 'redirection_spec' do
  let(:uri)    { URI('http://onetwotrip.com') }

  it 'inspect redirect path' do
    response = Net::HTTP.get_response uri
    expect(response.code).to eq('301')
    expect(response.header['location']).to include('www.onetwotrip.com')
  end
end