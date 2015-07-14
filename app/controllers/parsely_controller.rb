class ParselyController < ApplicationController
  def search
    keyword = URI::encode(params[:keyword])
    monthsago = (Date.today - 6.months).strftime("%Y-%m-%d")
    reg = 'apikey=' + ENV['EDNA_PARSELY_KEY'] + '&secret=' + ENV['EDNA_PARSELY_SECRET']
    params = reg + '&pub_date_start=2000-01-01&pub_date_end=' + monthsago + '&page=1&limit=100&sort=_hits&q=' + keyword + '&strategy=click&click.method=ref_search'
    response = HTTParty.get('https://api.parsely.com/v2/search?' + params)
    json = { query: URI::decode(keyword), status: 'success', response: response}
    render json: json
  end

  def realtime
    reg = 'apikey=' + ENV['EDNA_PARSELY_KEY'] + '&secret=' + ENV['EDNA_PARSELY_SECRET']
    params = reg + 'page=1&limit=100&time=5m'
    response = HTTParty.get('https://api.parsely.com/v2/realtime/posts?' + params)
    json = { body: response.body, code: response.code, message:response.message, header: response.headers.inspect}
    render json: response
  end

  def save
    render json: {status: 'success'}
  end
end
