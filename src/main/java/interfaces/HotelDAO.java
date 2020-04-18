package interfaces;

import java.util.List;
import java.util.Optional;

public interface HotelDAO<T> {
    Optional<T> getById(long id);
    List<T> getAll();
    void update(T t);
    void delete(T t);
    void deleteById(long id);
    void saveOrUpdate(T t);
}
