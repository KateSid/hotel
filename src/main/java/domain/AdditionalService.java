package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class AdditionalService implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_additional_service")
    private long idAdditionalService;
    private String nameAdditionalService;
    private int costAdditionalService;
    @OneToMany(mappedBy="additionalService", fetch = FetchType.LAZY)
    private Set<ClientAdditionalService> clientAdditionalServices = new HashSet<>();

    public void addClientAdditionalService(ClientAdditionalService clientAdditionalService){
        clientAdditionalServices.add(clientAdditionalService);
    }
    public void removeClientAdditionalService(ClientAdditionalService clientAdditionalService){
        clientAdditionalServices.remove(clientAdditionalService);
    }
    public Set<ClientAdditionalService> getClientAdditionalServices() {
        return clientAdditionalServices;
    }

    public void setClientAdditionalServices(Set<ClientAdditionalService> clientAdditionalServices) {
        this.clientAdditionalServices = clientAdditionalServices;
    }

    public long getIdAdditionalService() {
        return idAdditionalService;
    }

    public void setIdAdditionalService(long idAdditionalService) {
        this.idAdditionalService = idAdditionalService;
    }

    public String getNameAdditionalService() {
        return nameAdditionalService;
    }

    public void setNameAdditionalService(String nameAdditionalService) {
        this.nameAdditionalService = nameAdditionalService;
    }

    public int getCostAdditionalService() {
        return costAdditionalService;
    }

    public void setCostAdditionalService(int costAdditionalService) {
        this.costAdditionalService = costAdditionalService;
    }
}
