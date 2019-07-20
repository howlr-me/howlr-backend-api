# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        #  :trackable
        #  :validatable,
        #  :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  belongs_to :client, autosave: true

  has_many :users_cultures, dependent: :destroy
  has_many :cultures, through: :users_cultures

  has_many :users_events, dependent: :destroy
  has_many :events, through: :users_events

  validates :name, :email, presence: true

  rolify

  def member?
    admin? || has_role?(:member)
  end

  def admin?
    super_admin? || has_role?(:admin)
  end

  def super_admin?
    has_role?(:super_admin)
  end
end
