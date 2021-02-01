class Memo < ApplicationRecord
    belongs_to :user

    validates :title, length: {maximum: 36}
    validates :content, length: {maximum: 512}
end
