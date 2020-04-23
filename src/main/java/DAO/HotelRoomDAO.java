package DAO;

import domain.Client;
import domain.HotelRoom;
import interfaces.HotelDAO;
import util.HibernateAnnotationUtil;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

public class HotelRoomDAO implements HotelDAO<HotelRoom> {
    private static HibernateAnnotationUtil hibernateAnnotationUtil = new HibernateAnnotationUtil();

    @Override
    public Optional<HotelRoom> getById(long id) {
        hibernateAnnotationUtil.openCurrentSession();
        HotelRoom hotelRoom = hibernateAnnotationUtil.getCurrentSession().get(HotelRoom.class, id);
        hibernateAnnotationUtil.closeCurrentSession();
        return Optional.ofNullable(hotelRoom);
    }

    @Override
    public List<HotelRoom> getAll() {
        List<HotelRoom> hotelRooms = null;
        hibernateAnnotationUtil.openCurrentSession();
        hotelRooms = hibernateAnnotationUtil.getCurrentSession().createCriteria(HotelRoom.class).list();
        hibernateAnnotationUtil.closeCurrentSession();
        return hotelRooms;
    }

    public void save(HotelRoom hotelRoom) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().save(hotelRoom);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void update(HotelRoom hotelRoom) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().update(hotelRoom);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void delete(HotelRoom hotelRoom) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().delete(hotelRoom);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void saveOrUpdate(HotelRoom hotelRoom) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().saveOrUpdate(hotelRoom);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void deleteById(long id) {
        Optional<HotelRoom> hotelRoom = getById(id);
        hotelRoom.ifPresent(this::delete);
    }
}
