class Inventory < ApplicationRecord

  def self.search(params)
    inventories = Inventory.where("Name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    inventories
  end
  end
