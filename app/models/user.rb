class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]


  def has_role?
    !(Transporter.where(:email => self.email).blank? || Notifier.where(:email => self.email).blank?)
  end

end
