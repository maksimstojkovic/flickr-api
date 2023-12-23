class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new

    @search_params = search_params

    begin
      user = flickr.people.findByUsername username: search_params[:username]
      photos = flickr.people.getPhotos user_id: user.id
      @photo_urls = photos.map { |result| Flickr.url_s(result) }
    rescue Flickr::FailedResponse
      begin
        photos = flickr.people.getPhotos user_id: search_params[:username]
        @photo_urls = photos.map { |result| Flickr.url_s(result) }
      rescue Flickr::FailedResponse
        @photo_urls = {}
      end
    end
  end

  private

  def search_params
    if params.has_key?(:search)
      return params.require(:search).permit(:username)
    end

    {}
  end
end
