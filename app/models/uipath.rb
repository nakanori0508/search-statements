class Uipath < ApplicationRecord
  belongs_to :language

  def self.search(search)
    if search != ""
      Uipath.where('package_name LIKE(?)', "%#{search}%")
      .or(Uipath.where('activity_name LIKE(?)', "%#{search}%"))
      .or(Uipath.where('variable_type LIKE(?)', "%#{search}%"))
      .or(Uipath.where('version LIKE(?)', "%#{search}%"))
      .or(Uipath.where('how_to_use LIKE(?)', "%#{search}%"))
      .or(Uipath.where('description LIKE(?)', "%#{search}%"))
      .or(Uipath.where('reference_url LIKE(?)', "%#{search}%"))
    else
      Uipath.all
    end
  end
end