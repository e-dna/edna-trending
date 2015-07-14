class ParselyController < ApplicationController
  def search
    params = 'apikey=' + ENV['EDNA_PARSELY_KEY'] + '&secret=' + ENV['EDNA_PARSELY_SECRET'] + '&page=1&limit=100&sort=_hits&q=' + keyword + '&strategy=click&click.method=ref_search'
    response = HTTParty.get('https://api.parsely.com/v2/search?' + params)
    json = { body: response.body, code: response.code, message:response.message, header: response.headers.inspect}
    render json: response
  end

  def realtime
    params = 'apikey=' + ENV['EDNA_PARSELY_KEY'] + '&secret=' + ENV['EDNA_PARSELY_SECRET'] + 'page=1&limit=100&time=5m'
    response = HTTParty.get('https://api.parsely.com/v2/realtime/posts?' + params)
    json = { body: response.body, code: response.code, message:response.message, header: response.headers.inspect}
    render json: response
  end

  def save
    render json: {status: 'success'}
  end
end
