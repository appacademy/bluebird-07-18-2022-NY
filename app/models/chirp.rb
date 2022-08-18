# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord
    # validates :body, :author_id, presence: true
    validates :body, presence: true
    # creating custom validation
    validate :body_too_long
    
    def body_too_long
        # custom validations will run before predefined validations.
        # so, eventhough we have a validation defined for checking 
        # for presence on line 12, since this custom one runs first,
        # we need to check if self.body is truthy(present).
        if body && body.length > 140
            errors[:body] << "too long"
        end
    end
    
    # anytime when a table have a foreign key column write a belongs to
    # And write it's corresponding has_many/has_one on the class that
    # we are associating with. In this case it would be the User model.
    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
        # optional: true
        # when value for author_id can be null.
        # example would be the replies table that we had to write yesterday.
        # where we had parent reply id column, which could be null.
    
    has_many :likes,
        primary_key: :id,
        foreign_key: :chirp_id,
        class_name: :Like
    
end
