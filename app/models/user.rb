class User < ApplicationRecord
  def self.create_with_omniauth(auth)

    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    # user.email = "#{auth['uid']}@#{auth['provider']}.com"
    user.email = auth['info']['email']
    user.password = auth['uid']
    user.name = auth['info']['name']
    # user.gender = auth['info']['gender']
    user.gender = auth.extra.raw_info.gender
    user.save!

    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end
end
