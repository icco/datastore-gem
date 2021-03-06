require 'pp'

module Datastore
  class Client
    def initialize(options)
      base_url = 'https://www.googleapis.com/datastore/'
      api_version = 'v1beta1'
      api_scope_url = 'https://www.googleapis.com/auth/datastore'

      @dataset = options[:dataset]

      @project = options[:google_project]
      @google_client_email = options[:google_client_email]
      @api_url = base_url + api_version + '/projects/'
      key = Google::APIClient::KeyUtils.load_from_pkcs12(File.expand_path(options[:google_key_location]), 'notasecret')

      @client = Google::APIClient.new({
        :application_name => "datastore gem",
        :application_version => Datastore::VERSION,
      })

      params = {
        :audience => 'https://accounts.google.com/o/oauth2/token',
        :auth_provider_x509_cert_url => "https://www.googleapis.com/oauth2/v1/certs",
        :client_x509_cert_url => "https://www.googleapis.com/robot/v1/metadata/x509/#{@google_client_email}",
        :issuer => @google_client_email,
        :scope => api_scope_url,
        :signing_key => key,
        :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
      }

      @client.authorization = Signet::OAuth2::Client.new(params)

      @client.authorization.fetch_access_token!

      doc = File.read(File.join(File.dirname(__FILE__), 'datastore_v1beta1_rest.json'))
      @client.register_discovery_document('datastore', 'v1beta1', doc)
      @datastore = @client.discovery_document('datastore', 'v1beta1')
    end

    def insert key, value
      request = {
        :mutation => {
          :insertAutoId => [{
            :properties => {
              key => {
                :values => [{
                  :stringValue => value.to_s,
                }]
              }
            }
          }]
        }
      }

      @client.execute(
        :api_method => @client.discovered_method('blindwrite', 'datastore'),
        :parameters => {
          :datasetId => @dataset,
        },
        :body_object => request
      )
    end
  end
end
