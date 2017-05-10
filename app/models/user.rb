class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.oauth_token        = auth_info.credentials.token
    end
    #user id was not changing, but token was changing, it was invalid, soemtimes tokens expire... what happens when you no longer have the token... create a catch for this! When user logs in, if we find by id and refresh id and token is invalid do something about
  end
end
