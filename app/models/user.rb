class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    exisiting_user = true
    found_user = where(uid: auth_info[:uid]).first_or_create do |user|
      exisiting_user = false
      user.uid                = auth_info.uid
      user.name               = auth_info.extra.raw_info.name
      user.oauth_token        = auth_info.credentials.token
    end
    #this may or may not work ...??
    found_user.update(oauth_token: auth_info.credentials.token) if exisiting_user
    found_user
  end
    #user id was not changing, but token was changing, it was invalid, soemtimes tokens expire... what happens when you no longer have the token... create a catch for this! When user logs in, if we find by id and refresh id and token is invalid do something about

  def refresh_token
      #call to github service refresh_token --- should return the token value, assign it to a local variable c
      #update(oauth_token: new_token- where do I get this??)
  end
end
