package DAO;

import domain.AdditionalService;
import interfaces.HotelDAO;
import util.HibernateAnnotationUtil;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

public class AdditionalServiceDAO implements HotelDAO<AdditionalService> {
    private static HibernateAnnotationUtil hibernateAnnotationUtil = new HibernateAnnotationUtil();

    @Override
    public Optional<AdditionalService> getById(long id) {
        hibernateAnnotationUtil.openCurrentSession();
        AdditionalService additionalService = hibernateAnnotationUtil.getCurrentSession().get(AdditionalService.class, id);
        hibernateAnnotationUtil.closeCurrentSession();
        return Optional.ofNullable(additionalService);
    }

    @Override
    public List<AdditionalService> getAll() {
        List<AdditionalService> additionalServices = null;
        hibernateAnnotationUtil.openCurrentSession();
        additionalServices = hibernateAnnotationUtil.getCurrentSession().createCriteria(AdditionalService.class).list();
        hibernateAnnotationUtil.closeCurrentSession();
        return additionalServices;
    }

    public void save(AdditionalService additionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().save(additionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void update(AdditionalService additionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().update(additionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void delete(AdditionalService additionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().delete(additionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void saveOrUpdate(AdditionalService additionalService) {
        hibernateAnnotationUtil.openCurrentSessionwithTransaction();
        hibernateAnnotationUtil.getCurrentSession().saveOrUpdate(additionalService);
        hibernateAnnotationUtil.closeCurrentSessionwithTransaction();
    }

    @Override
    public void deleteById(long id) {
        Optional<AdditionalService> additionalService = getById(id);
        additionalService.ifPresent(this::delete);
    }
}
