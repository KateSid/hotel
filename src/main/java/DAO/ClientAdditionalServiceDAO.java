package DAO;

import domain.AdditionalService;
import domain.Client;
import domain.ClientAdditionalService;
import domain.ClientAdditionalServiceCompositeId;
import interfaces.HotelDAO;
import org.hibernate.Hibernate;
import util.HibernateAnnotationUtil;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class ClientAdditionalServiceDAO {
    private static HibernateAnnotationUtil hibernateAnnotationUtil = new HibernateAnnotationUtil();

    public Optional<ClientAdditionalService> getById(ClientAdditionalServiceCompositeId id) {
        hibernateAnnotationUtil.openCurrentSession();
        ClientAdditionalService clientAdditionalService = hibernateAnnotationUtil.getCurrentSession().get(ClientAdditionalService.class, id);

        Hibernate.initialize(clientAdditionalService.getClient());
        Hibernate.initialize(clientAdditionalService.getAdditionalService());
        hibernateAnnotationUtil.closeCurrentSession();
        return Optional.ofNullable(clientAdditionalService);
    }


    public List<ClientAdditionalService> getAll() {
        List<ClientAdditionalService> clientAdditionalServices = null;
        hibernateAnnotationUtil.openCurrentSession();
        clientAdditionalServices = hibernateAnnotationUtil.getCurrentSession().createCriteria(ClientAdditionalService.class).list();
        for (ClientAdditionalService c:clientAdditionalServices) {
            Hibernate.initialize(c.getClient());
            Hibernate.initialize(c.getAdditionalService());
        }
        hibernateAnnotationUtil.closeCurrentSession();
        return clientAdditionalServices;
    }


    public void save(long clientId, long additionalServiceId) {
        ClientAdditionalService clientAdditionalService = new ClientAdditionalService();
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        clientAdditionalService.setClientAdditionalServiceCompositeId(
                new ClientAdditionalServiceCompositeId(clientId, additionalServiceId));
        Client client = hibernateAnnotationUtil.getCurrentSession().get(Client.class, clientId);
        client.addClientAdditionalService(clientAdditionalService);
        clientAdditionalService.setClient(client);
        AdditionalService additionalService = hibernateAnnotationUtil.getCurrentSession().get(AdditionalService.class, additionalServiceId);
        additionalService.addClientAdditionalService(clientAdditionalService);
        clientAdditionalService.setAdditionalService(additionalService);
        clientAdditionalService.setDatetime(Date.valueOf(LocalDate.now()));
        hibernateAnnotationUtil.getCurrentSession().update(client);
        hibernateAnnotationUtil.getCurrentSession().update(additionalService);
        hibernateAnnotationUtil.getCurrentSession().save(clientAdditionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }


    public void update(ClientAdditionalService clientAdditionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        clientAdditionalService.setAdditionalService(hibernateAnnotationUtil
                .getCurrentSession().get(AdditionalService.class,
                        clientAdditionalService.getClientAdditionalServiceCompositeId().getIdAdditionalService()));
        clientAdditionalService.setClient(hibernateAnnotationUtil
                .getCurrentSession().get(Client.class,
                        clientAdditionalService.getClientAdditionalServiceCompositeId().getIdClient()));
        hibernateAnnotationUtil.getCurrentSession().update(clientAdditionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }


    public void delete(ClientAdditionalService clientAdditionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        clientAdditionalService.setClient(hibernateAnnotationUtil.getCurrentSession()
                .get(Client.class, clientAdditionalService.getClientAdditionalServiceCompositeId().getIdClient()));
        clientAdditionalService.setAdditionalService(hibernateAnnotationUtil.getCurrentSession()
                .get(AdditionalService.class, clientAdditionalService.getClientAdditionalServiceCompositeId().getIdAdditionalService()));
        hibernateAnnotationUtil.getCurrentSession().delete(clientAdditionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }


    public void saveOrUpdate(ClientAdditionalService clientAdditionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        Client client = hibernateAnnotationUtil.getCurrentSession().get(Client.class, clientAdditionalService.getClientAdditionalServiceCompositeId().getIdClient());
        client.addClientAdditionalService(clientAdditionalService);
        clientAdditionalService.setClient(client);
        AdditionalService additionalService = hibernateAnnotationUtil.getCurrentSession().get(AdditionalService.class,clientAdditionalService.getClientAdditionalServiceCompositeId().getIdAdditionalService());
        additionalService.addClientAdditionalService(clientAdditionalService);
        clientAdditionalService.setAdditionalService(additionalService);
        hibernateAnnotationUtil.getCurrentSession().update(client);
        hibernateAnnotationUtil.getCurrentSession().update(additionalService);
        hibernateAnnotationUtil.getCurrentSession().saveOrUpdate(clientAdditionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }


    public void deleteById(ClientAdditionalServiceCompositeId id) {
        Optional<ClientAdditionalService> clientAdditionalService = getById(id);
        clientAdditionalService.ifPresent(this::delete);
    }
}
