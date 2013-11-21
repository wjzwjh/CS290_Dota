require 'securerandom'

class User < ActiveRecord::Base
  validates :userName,  :presence => true

  validates :password, :confirmation => true

  attr_accessor :password_confirmation
  attr_accessible :userName,:password,:password_confirmation,:wallet

  attr_reader   :password


  #validate :username_is_email
  #validate :password_is_matched
  #
  #private
  #
  #
  def username_is_email
    errors.add(:userName,'is not in email format')  unless userName=~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end

  def password_is_matched
    errors.add(:password,'enter two times does not match')  unless password==password_confirmation
  end

  def self.hash_password(password,salt)
    Digest::SHA2.hexdigest(password +salt)
  end

  def generate_salt
    self.salt = self.object_id.to_s  + rand.to_s
  end

  def  password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password= self.class.hash_password(password,salt)
    end

  end

  def self.authenticate(userName,password)
    user = find_by_userName(userName)
    if user!=nil
      if user.hashed_password == hash_password(password,user.salt)
        logger.info('wengjiahong')
        user
      end
    end
  end
end
