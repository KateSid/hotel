package DAO;

import domain.Client;
import domain.HotelRoom;
import domain.Residence;
import domain.ResidenceCompositeId;
import org.hibernate.Hibernate;
import util.HibernateAnnotationUtil;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class ResidenceDAO {
    private static HibernateAnnotationUtil hibernateAnnotationUtil = new HibernateAnnotationUtil();

    public Optional<Residence> getById(ResidenceCompositeId id) {
        hibernateAnnotationUtil.openCurrentSession();
        Residence residence = hibernateAnnotationUtil.getCurrentSession().get(Residence.class, id);
        Hibernate.initialize(residence.getResidenceCompositeId());
        hibernateAnnotationUtil.closeCurrentSession();
        return Optional.ofNullable(residence);
    }

    public List<Residence> getAll() {
        List<Residence> residences = null;
        hibernateAnnotationUtil.openCurrentSession();
        residences = hibernateAnnotationUtil.getCurrentSession().createCriteria(Residence.class).list();
        for (Residence residence:residences) {
            Hibernate.initialize(residence.getClient());
            Hibernate.initialize(residence.getHotelRoom());
        }
        hibernateAnnotationUtil.closeCurrentSession();
        return residences;
    }


    public void save(long clientId, long hotelRoomId) {
        Residence residence = new Residence();
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        Date date = Date.valueOf(LocalDate.now());
        residence.setResidenceCompositeId(new ResidenceCompositeId(clientId, hotelRoomId, date));
        Client client = hibernateAnnotationUtil.getCurrentSession().get(Client.class, clientId);
        client.addResidence(residence);
        residence.setClient(client);
        HotelRoom hotelRoom = hibernateAnnotationUtil.getCurrentSession().get(HotelRoom.class, hotelRoomId);
        hotelRoom.addResidence(residence);
        residence.setHotelRoom(hotelRoom);
        hibernateAnnotationUtil.getCurrentSession().update(client);
        hibernateAnnotationUtil.getCurrentSession().update(hotelRoom);
        hibernateAnnotationUtil.getCurrentSession().save(residence);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }


    public void update(Residence residence) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        residence.setClient(hibernateAnnotationUtil.getCurrentSession()
                .get(Client.class, residence.getResidenceCompositeId().getIdClient()));
        residence.setHotelRoom(hibernateAnnotationUtil
                .getCurrentSession().get(HotelRoom.class, residence.getResidenceCompositeId().getIdHotelRoom()));
        hibernateAnnotationUtil.getCurrentSession().update(residence);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }


    public void delete(Residence residence) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        residence.setClient(hibernateAnnotationUtil.getCurrentSession()
                .get(Client.class, residence.getResidenceCompositeId().getIdClient()));
        residence.setHotelRoom(hibernateAnnotationUtil
                .getCurrentSession().get(HotelRoom.class, residence.getResidenceCompositeId().getIdHotelRoom()));
        hibernateAnnotationUtil.getCurrentSession().delete(residence);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    public void saveOrUpdate(Residence residence) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().saveOrUpdate(residence);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

}
