class ParselyController < ApplicationController
  def search
    response = HTTParty.get('https://api.parsely.com/v2/search?apikey=ENV['EDNA_PARSELY_KEY']&secret=ENV['EDNA_PARSELY_SECRET']&page=1&limit=5&sort=_hits&q=chick-fil-a&strategy=click&click.method=ref_search')
    json = { body: response.body, code: response.code, message:response.message, header: response.headers.inspect}
    render json: response
  end

  def save
    return json: {status: 'success'}
  end
end
