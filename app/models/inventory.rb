require 'csv'
class Inventory < ApplicationRecord
  validates :Value, numericality: true

  def self.to_csv
    attributes = %w{Name Serial Value}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end


  def self.search(params)
    inventories = Inventory.where("Serial LIKE ? or Name LIKE ?", "%{params[:search]}%","%#{params[:search]}") if params[:search].present?
    inventories
  end

end