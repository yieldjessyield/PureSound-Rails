class ArtistsController < ApplicationController
  skip_before_action :authenticate_user
  def create
    # check out params, they are awesome
    #  save this data to artist tabel in db
    # render back a conformatin that data was saved
    byebug
  end

end
