class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :type_bien
      t.string :type_location
      t.integer :nb_personne
      t.integer :nb_chambre
      t.integer :nb_sdb
      t.string :nom_annonce
      t.text :description_annonce
      t.string :adresse_annonce
      t.boolean :is_wifi
      t.boolean :is_tv
      t.boolean :is_petit_dejeuner
      t.boolean :is_cuisine
      t.boolean :is_couvert
      t.boolean :is_lave_vaisselle
      t.boolean :is_cafetiere
      t.boolean :is_machine_a_laver
      t.boolean :is_table_fer_repasser
      t.boolean :is_armoire
      t.boolean :is_shampoing
      t.boolean :is_climatisation
      t.boolean :is_terrasse
      t.boolean :is_jardin
      t.boolean :is_piscine
      t.boolean :is_voiture
      t.boolean :is_mer
      t.boolean :is_lit_bebe
      t.boolean :active
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
