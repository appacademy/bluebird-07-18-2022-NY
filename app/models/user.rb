# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string           not null
#  email                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  age                   :integer          not null
#  password              :string           not null
#  political_affiliation :string
#  password_digest       :string           not null
#  session_token         :string           not null
#
class User < ApplicationRecord
    validates :username, :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, :age, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    before_validation :ensure_session_token

    attr_reader :password

    # SPIRE

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def password=(password)
        # debugger
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        # debugger
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def reset_session_token!
        # debugger
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        # debugger
        self.session_token ||= generate_unique_session_token
    end

    def generate_unique_session_token
        # debugger
        token = SecureRandom::urlsafe_base64

        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end

        token
    end


    # this is corresponding to belongs to defined in Chirp model.
    has_many :chirps,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Chirp,
        dependent: :destroy
        # when a user is deleted, dependent: :destroy will
        # also remove all the chirps that was written by this user.
    
    # Establishing associations will provide methods which we
    # can invoke on an instance of this model.
    # This is why we said we use JOIN with our rails app 99%
    # this association is joining the tables togehter.

    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like
    # written in another way.
    # has_many(:likes, {primary_key: :id, foreign_key: :liker_id, class_name: :Like})

    has_many :liked_chirps,
        through: :likes, # association that exists on this model
        source: :chirp # association that exists on the end point (in Like model)
end

# difference between .save and .save!
# with .save! if saving transaction fails, it will provide
# meaningful error message for you to know why it failed.

# however, if a transaction fails, records of error message
# is saved in .errors object
# then, if you want to see full message, then you can key into
# .full_messages to verify failure messages.
# ex) user.errors.full_messages
