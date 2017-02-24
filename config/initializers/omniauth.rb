evernote = {
    consumer_key: ENV['EVERNOTE_KEY'],
    consumer_secret: ENV['EVERNOTE_SECRET'],
    sandbox: true
}

evernote_site = evernote[:sandbox] ? 'https://sandbox.evernote.com' : 'https://www.evernote.com'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :evernote,
           evernote[:consumer_key],
           evernote[:consumer_secret],
           client_options: {site: evernote_site}
end

OmniAuth.config.on_failure = OmniAuthController.action(:failure)
