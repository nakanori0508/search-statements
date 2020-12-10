class Ror < ApplicationRecord
  belongs_to :language

  def self.search(search)
    if search != ""
      Ror.where('gem_name LIKE(?)', "%#{search}%").or(Ror.where('about_gem LIKE(?)', "%#{search}%"))
    else
      Ror.all
    end
  end
end
