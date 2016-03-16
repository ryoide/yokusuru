class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, authentication_keys: [:email, :team_name]
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)

  #accessor
  attr_accessor :team_name

  #association
  belongs_to :team

  #validation
  before_validation :team_name_to_id, if: :has_team_key?
 
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    team_name = conditions.delete(:team_name)
    team_id = Team.where(name: team_name).first
    email = conditions.delete(:email)
 
    # devise認証を、複数項目に対応させる
    if team_id && email
      where(conditions).where(["team_id = :team_id AND email = :email",
        { team_id: team_id, email: email }]).first
    elsif conditions.has_key?(:confirmation_token)
      where(conditions).first
    else
      false
    end
  end

   private
  def has_team_key?
    team_name.present?
  end
 
  def team_name_to_id
    team = Team.where(name: team_name).first_or_create
    self.team_id = team.id
  end
end
