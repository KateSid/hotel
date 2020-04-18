package domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ClientAdditionalServiceCompositeId implements Serializable {
    @Column(name="id_client")
    private long idClient;
    @Column(name = "id_additional_service")
    private long idAdditionalService;

    public ClientAdditionalServiceCompositeId() {
    }

    public ClientAdditionalServiceCompositeId(long idClient, long idAdditionalService) {
        this.idClient = idClient;
        this.idAdditionalService = idAdditionalService;
    }

    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    public long getIdAdditionalService() {
        return idAdditionalService;
    }

    public void setIdAdditionalService(long idAdditionalService) {
        this.idAdditionalService = idAdditionalService;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ClientAdditionalServiceCompositeId that = (ClientAdditionalServiceCompositeId) o;
        return idClient == that.idClient &&
                idAdditionalService == that.idAdditionalService;
    }

    @Override
    public int hashCode() {
        return Objects.hash(idClient, idAdditionalService);
    }
}
