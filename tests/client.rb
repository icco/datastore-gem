require 'datastore'

Shindo.tests("Datastore Client") do

  tests('connect') do
    client = Datastore::Client.new({
      :google_client_email => "829275714230@developer.gserviceaccount.com",
      :google_project => "google.com:natwelch-devconsole",
      :google_key_location => '~/Projects/icco.me/conf/keys/natwelch-devconsole.p12',
    })

    tests("Client#new").returns(true) do
      !client.nil?
    end
  end
end
