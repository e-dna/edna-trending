class TrendingsController < ApplicationController
  def get
    response = HTTParty.get('https://api.stackexchange.com/2.2/questions?site=stackoverflow')
    puts response.body, response.code, response.message, response.headers.inspect
    response = { body: response.body, code: response.code, message:response.message, header: response.headers.inspect}.to_json
    render json: response
  end

  def root
    render json: { status: 'success' }.to_json
  end
end
