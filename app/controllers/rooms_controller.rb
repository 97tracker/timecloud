class RoomController < ApplicationController
    
before_action :set_room, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show] #Il faut être identifié pour créer une annonce mais pas pour les consulter

    def index
        @rooms = current_user.rooms #Je récupère toutes les annonces du current user donc moi
    end
    
    def new
        @room = current_user.rooms.build
    end
    
    def create #Nouvelle entrée dans la table room, j'ajoute la condition, si l'annonce est save alors c'est bon sinon il doit en créer une !
        @room = current_user.rooms.build(room_params)
        if @room.save
            redirect_to @room, notice:"Votre annonce a été ajoutée avec succès"
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @room.update(room_params)
            redirect_to @room, notice:"Modification enregristrée"
        else
            render :edit
    end
    
    private 
        def set_room
            @room = Room.find(params[:id]) #Je récupère l'annonce liée au numéro dans l'URL
        end
        
        def room_params 
            params.require(:room).permit(:type_bien, :type_location, :nb_personne, :nb_chambre, :nb_sdb, :nom_annonce, :description_annonce, :adresse_annonce, :is_wifi, :is_tv, :is_petit_dejeuner, :is_cuisine, :is_couvert, :is_lave_vaisselle, :is_cafetiere, :is_machine_a_laver, :is_table_fer_repasser, :is_armoire, :is_shampoing, :is_climatisation, :is_terrasse, :is_jardin, :is_piscine, :is_voiture, :is_mer, :is_lit_bebe, :price, :active)
        end

end