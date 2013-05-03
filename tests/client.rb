require 'datastore'

Shindo.tests("Datastore Client") do

  tests('authentication') do

    client = Google::APIClient.new({
      :application_name => "datastore gem",
      :application_version => Datastore::VERSION,
    })

    key = Google::APIClient::KeyUtils.load_from_pkcs12(File.expand_path('~/Projects/icco.me/conf/keys/natwelch-cloud.p12'), 'notasecret')
    client.authorization = Signet::OAuth2::Client.new(
      :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
      :audience => 'https://accounts.google.com/o/oauth2/token',
      :scope => 'https://www.googleapis.com/auth/urlshortner',
      :issuer => '362304721969@developer.gserviceaccount.com',
      :signing_key => key
    )
    client.authorization.fetch_access_token!
  end

  tests('connect') do

    tests("Client#new") do
      client = Datastore::Client.new({
        :google_project => 'xz-natwelch-cloud',
        :google_client_email => '362304721969@developer.gserviceaccount.com',
        :google_key_location => '~/Projects/icco.me/conf/keys/natwelch-cloud.p12',
      })

      return client
    end
  end


end
