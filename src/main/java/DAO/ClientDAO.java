package DAO;

import domain.Client;
import domain.Residence;
import interfaces.HotelDAO;
import org.hibernate.Hibernate;
import util.HibernateAnnotationUtil;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;


public class ClientDAO implements HotelDAO<Client> {
    private static HibernateAnnotationUtil hibernateAnnotationUtil = new HibernateAnnotationUtil();;

    public Optional<Client> getById(long id) {
        hibernateAnnotationUtil.openCurrentSession();
        Client client = hibernateAnnotationUtil.getCurrentSession().get(Client.class, id);
        hibernateAnnotationUtil.closeCurrentSession();
        return Optional.ofNullable(client);
    }

    public List<Client> getAll() {
        hibernateAnnotationUtil.openCurrentSession();
        List<Client> clients = hibernateAnnotationUtil.getCurrentSession().createCriteria(Client.class).list();
        /*for (Client client : clients) {
            Hibernate.initialize(client.getResidences());
            Hibernate.initialize(client.getClientAdditionalServices());
        }*/
        hibernateAnnotationUtil.closeCurrentSession();
        return clients;
    }

    public void save(Client client) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().save(client);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    public void update(Client client) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().update(client);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    public void delete(Client client) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        client=hibernateAnnotationUtil.getCurrentSession().get(Client.class,client.getIdClient());

        hibernateAnnotationUtil.getCurrentSession().delete(client);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void deleteById(long id) {
        Optional<Client> client=getById(id);
        client.ifPresent(this::delete);
    }

    public void saveOrUpdate(Client client) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().saveOrUpdate(client);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

}
