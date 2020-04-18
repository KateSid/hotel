package domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

@Embeddable
public class ResidenceCompositeId implements Serializable {
    @Column(name="id_client")
    private long idClient;
    @Column(name = "id_hotel_room")
    private long idHotelRoom;
    @Column(name="check_in_datetime", nullable = false)
    private Date checkInDatetime;

    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    public long getIdHotelRoom() {
        return idHotelRoom;
    }

    public void setIdHotelRoom(long idHotelRoom) {
        this.idHotelRoom = idHotelRoom;
    }

    public Date getCheckInDatetime() {
        return checkInDatetime;
    }

    public void setCheckInDatetime(Date checkInDatetime) {
        this.checkInDatetime = checkInDatetime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ResidenceCompositeId that = (ResidenceCompositeId) o;
        return idClient == that.idClient &&
                idHotelRoom == that.idHotelRoom &&
                checkInDatetime.equals(that.checkInDatetime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idClient, idHotelRoom, checkInDatetime);
    }

    public ResidenceCompositeId(long idClient, long idHotelRoom, Date checkInDatetime) {
        this.idClient = idClient;
        this.idHotelRoom = idHotelRoom;
        this.checkInDatetime = checkInDatetime;
    }

    public ResidenceCompositeId() {
    }
}
