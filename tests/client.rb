Shindo.tests("Datastore Client") do

  tests('connect') do

    tests("").succeeds do
      client = Datastore::Client.new({
        :google_project => 'xz-natwelch-cloud',
        :google_client_email => '362304721969@developer.gserviceaccount.com',
        :google_key_location => '~/Projects/icco.me/conf/keys/natwelch-cloud.p12',
      })

      p client
    end
  end


end
