package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
public class Residence implements Serializable {

    @EmbeddedId
    private ResidenceCompositeId residenceCompositeId;
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("id_hotel_room")
    @JoinColumn(name="id_hotel_room")
    private HotelRoom hotelRoom;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="id_client")
    @MapsId("id_client")
    private Client client;
    private Date checkOutDatetime;

    public ResidenceCompositeId getResidenceCompositeId() {
        return residenceCompositeId;
    }

    public void setResidenceCompositeId(ResidenceCompositeId residenceCompositeId) {
        this.residenceCompositeId = residenceCompositeId;
    }

    public HotelRoom getHotelRoom() {
        return hotelRoom;
    }

    public void setHotelRoom(HotelRoom hotelRoom) {
        this.hotelRoom = hotelRoom;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Date getCheckOutDatetime() {
        return checkOutDatetime;
    }

    public void setCheckOutDatetime(Date checkOutDatetime) {
        this.checkOutDatetime = checkOutDatetime;
    }
}
