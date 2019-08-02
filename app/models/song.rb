class Song < ApplicationRecord
    validates :release_year, numericality: { less_than: Date.today.year}
    validates :release_year, presence: true, if: :released?
    validates :title, presence: true
    

end
