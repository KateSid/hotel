package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class HotelRoom implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_hotel_room")
    private long idHotelRoom;
    private int costHotelRoom;
    private int numberPersons;
    @Enumerated(EnumType.STRING)
    private TypeHotelRoom typeHotelRoom;
    @OneToMany(mappedBy = "hotelRoom", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Residence> residences=new HashSet<>();
    public void removeResidence(Residence residence){
        residences.remove(residence);
    }
    public void addResidence(Residence residence){
        residences.add(residence);
    }
    public Set<Residence> getResidence() {
        return residences;
    }

    public void setResidence(Set<Residence> residences) {
        this.residences = residences;
    }

    public long getIdHotelRoom() {
        return idHotelRoom;
    }

    public void setIdHotelRoom(long idHotelRoom) {
        this.idHotelRoom = idHotelRoom;
    }

    public int getCostHotelRoom() {
        return costHotelRoom;
    }

    public void setCostHotelRoom(int costHotelRoom) {
        this.costHotelRoom = costHotelRoom;
    }

    public int getNumberPersons() {
        return numberPersons;
    }

    public void setNumberPersons(int numberPersons) {
        this.numberPersons = numberPersons;
    }

    public TypeHotelRoom getTypeHotelRoom() {
        return typeHotelRoom;
    }

    public void setTypeHotelRoom(TypeHotelRoom typeHotelRoom) {
        this.typeHotelRoom = typeHotelRoom;
    }
}
