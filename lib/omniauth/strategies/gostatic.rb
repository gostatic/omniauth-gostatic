require 'json'
require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class GoStatic < OmniAuth::Strategies::OAuth2

      option :name, 'gostatic'

      option :client_options, {
        site: 'https://api.gostatic.io/v1',
        authorize_url: 'https://id.gostatic.io/oauth/authorize',
        token_url: 'https://id.gostatic.io/oauth/token',
      }

      uid { raw_info['data']['id'] }

      info do
        {
          'email' => raw_info['data']['attributes']['email'],
          'name' => raw_info['data']['attributes']['name'],
          'image' => raw_info['data']['attributes']['avatar'],
        }
      end

      extra do
        {
          raw_info: raw_info,
          identities: identities,
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('me').parsed
      end

      def identities
        access_token.options[:model] = :query
        @identities ||= access_token.get('identities').parsed
      end

    end
  end
end
