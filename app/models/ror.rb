class Ror < ApplicationRecord
  belongs_to :language

  def self.search(search)
    if search != ""
      Ror.where('gem_name LIKE(?)', "%#{search}%")
      .or(Ror.where('about_gem LIKE(?)', "%#{search}%"))
      .or(Ror.where('syntax_name LIKE(?)', "%#{search}%"))
      .or(Ror.where('version LIKE(?)', "%#{search}%"))
      .or(Ror.where('how_to_use LIKE(?)', "%#{search}%"))
      .or(Ror.where('description LIKE(?)', "%#{search}%"))
      .or(Ror.where('reference_url LIKE(?)', "%#{search}%"))
    else
      Ror.all
    end
  end
end
