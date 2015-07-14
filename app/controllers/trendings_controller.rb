class TrendingsController < ApplicationController
  def get
    response = HTTParty.get('http://hawttrends.appspot.com/api/terms/')
    json = { body: response.body, code: response.code, message:response.message, header: response.headers.inspect}
    render json: response
  end

  def root
    render json: { status: 'success' }.to_json
  end
end
