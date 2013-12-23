class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :username, :inactive, :role_ids, :supervisor_id
  # attr_accessible :title, :body
  belongs_to :supervisor, :class_name=> 'User'
  # devise :session_limitable

  if CONFIG[:authenticate_devise_with_ldap]
    devise :ldap_authenticatable, :trackable
    before_create :get_ldap_name
  else
    validates :email, :presence => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  end

  after_create :add_user_roles

  # attr_accessible :title, :body
  validate :role_presence


  validates :username, :presence => true,
  :uniqueness => {
    :message => "This user id already exists in the system.",
    :case_sensitive => false
  }

  def role_presence
     if roles.empty? && Rails.env != "test"
        errors.add(:role, "atleast one role must be added")
        false
     else
        true
     end
  end

  def add_user_roles
    if Rails.env == "test"
      add_role(:user)
    end
  end


  def get_ldap_name
    self.last_name = Devise::LdapAdapter.get_ldap_param(self.username, 'sn') rescue nil
    self.email = Devise::LdapAdapter.get_ldap_param(self.username, 'mail') rescue "#{username}@ratnakarbank.in"
    if self.last_name.blank?
      errors.add(:username, "Invalid User Id")
      return false
    elsif self.first_name.blank?
      self.first_name = Devise::LdapAdapter.get_ldap_param(self.username, 'givenname') rescue nil
      errors.add(:username, "User Name: #{self.first_name} #{self.last_name}, Kindly validate name before creation.")
      return false
    end
    return true
  end

  def name
    "#{first_name} #{last_name}(#{username})"
  end

  def name_list
    "#{username} - #{first_name} #{last_name}"
  end

end
