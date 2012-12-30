class Host < ActiveRecord::Base
  has_many :project_hosts
  has_many :projects, :through=>:project_hosts
 
  def bigger_avatar
    return self.avatar.gsub("normal", "bigger") if !self.avatar.nil?
    return nil
  end
end
