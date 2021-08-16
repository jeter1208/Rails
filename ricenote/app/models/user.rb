class User < ApplicationRecord
 attr_accessor :password_confirmation

 validates :email, presence:true
 validates :password, presence:true
 validates :account, presence:true

 before

 
require "digest"

 private

  def encrypt_password
    salted_pw = "xyz#{self.password}827128#{self}"
      
  end
end
