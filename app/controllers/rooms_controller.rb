class RoomsController < ApplicationController
before_action :set_room, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show] #Il faut être identifié pour créer une annonce mais pas pour les consulter
before_action :require_same_user, only: [:edit, :update]

    def index
        @rooms = current_user.rooms #Je récupère toutes les annonces du current user donc moi
    end
    
    def new
        @room = current_user.rooms.build
    end
    
    def create
         @room = current_user.rooms.build(room_params)
            if @room.save
                if params[:images]
                    params[:images].each do |i|
                      @room.photos.create(image: i)
                  end
                end
            @photos = @room.photos
                redirect_to edit_room_path(@room), notice:"Votre annonce a été ajouté avec succès" 
            else
               render :new
            end
    end
    
    def show
        @photos = @room.photos
    end
    
    def edit
        @photos = @room.photos
    end
    
    def update
        if @room.update(room_params)
            if params[:images]
                    params[:images].each do |i|
                      @room.photos.create(image: i)
                  end
            end
              @photos = @room.photos
            redirect_to edit_room_path(@room), notice:"Modification enregristrée"
        else
            render :edit
        end
    end

    private 
        def set_room
            @room = Room.find(params[:id]) #Je récupère l'annonce liée au numéro dans l'URL
        end
        
        def room_params 
            params.require(:room).permit(:type_bien, :type_location, :nb_personne, :nb_chambre, :nb_sdb, :nom_annonce, :description_annonce, :adresse_annonce, :is_wifi, :is_tv, :is_petit_dejeuner, :is_cuisine, :is_couvert, :is_lave_vaisselle, :is_cafetiere, :is_machine_a_laver, :is_table_fer_repasser, :is_armoire, :is_shampoing, :is_climatisation, :is_terrasse, :is_jardin, :is_piscine, :is_voiture, :is_mer, :is_lit_bebe, :active, :price)
        end
        
        def require_same_user
            if current_user.id != @room.user_id
                flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
                redirect_to root_path
            end
        end
end  

