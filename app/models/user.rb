class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || '/admin'
  end
end
