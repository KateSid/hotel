package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
public class ClientAdditionalService implements Serializable {

    @EmbeddedId
    private ClientAdditionalServiceCompositeId clientAdditionalServiceCompositeId;
    private Date datetime;
    @ManyToOne( fetch = FetchType.LAZY)
    @JoinColumn(name="id_client")
    @MapsId("id_client")
    private Client client;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="id_additional_service")
    @MapsId("id_additional_service")
    private AdditionalService additionalService;

    public ClientAdditionalServiceCompositeId getClientAdditionalServiceCompositeId() {
        return clientAdditionalServiceCompositeId;
    }

    public void setClientAdditionalServiceCompositeId(ClientAdditionalServiceCompositeId clientAdditionalServiceCompositeId) {
        this.clientAdditionalServiceCompositeId = clientAdditionalServiceCompositeId;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public AdditionalService getAdditionalService() {
        return additionalService;
    }

    public void setAdditionalService(AdditionalService additionalService) {
        this.additionalService = additionalService;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}
