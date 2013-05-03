require 'datastore'

Shindo.tests("Datastore Client") do

  tests('connect') do

    tests("Client#new") do
      client = Datastore::Client.new({
        :google_project => 'xz-natwelch-cloud',
        :google_client_email => '362304721969@developer.gserviceaccount.com',
        :google_key_location => '~/Projects/icco.me/conf/keys/natwelch-cloud.p12',
      })

      p client

      return client
    end
  end


end
