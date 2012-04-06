require 'multi_json'

module OmniAuth
  module Strategies
    class Me2day
      include OmniAuth::Strategy

      args [:akey]

      option :title,   "me2day"

      attr_accessor :access_token
      attr_accessor :raw_info

      def akey
        options.akey
      end

      uid { raw_info['id'] }

      info do
        {
          :nickname => raw_info['nickname'],
          :email => raw_info['email'],
          :name => raw_info['realname'] || raw_info['nickname'],
          :location => raw_info['location']['name'],
          :image => raw_info['face'],
          :description => raw_info['description'],
          :urls => {
            'Website' => raw_info['me2dayHome']
          }
        }
      end

      credentials do
        { :token => access_token[:token], :secret => access_token[:user_key] }
      end

      extra do
        { :raw_info => raw_info }
      end

      def request_phase
        api_uri = "http://me2day.net/api/get_auth_url.json?akey=#{akey}"
        response = Faraday.get api_uri
        h = MultiJson.decode(response.body)
        redirect h['url']
      end

      def callback_phase
        @access_token = {:token => request[:token], :user_key => request[:user_key]}

        uid = request[:user_id]
        profile_url = "http://me2day.net/api/get_person/#{uid}.json?akey=#{akey}"

        response = Faraday.get profile_url
        @raw_info = MultiJson.decode(response.body)

        super
      end
    end
  end
end

