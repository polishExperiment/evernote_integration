class NotebooksController < ApplicationController
  def index
    token = current_user.socials.evernote.first.try(:token)
    client = EvernoteOAuth::Client.new( token: token )
    @notebooks = client.note_store.listNotebooks
  end
end
