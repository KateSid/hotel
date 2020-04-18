package domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Client implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_client")
    private long idClient;
    private String fio;
    private String passportData;
    private String phone;
    @OneToMany(mappedBy = "client" ,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<ClientAdditionalService> clientAdditionalServices = new HashSet<>();
    @OneToMany(mappedBy = "client", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Residence> residences = new HashSet<>();

    public Set<Residence> getResidences() {
        return residences;
    }

    public void addResidence(Residence residence){
        residences.add(residence);
    }
    public void addClientAdditionalService(ClientAdditionalService clientAdditionalService){
        clientAdditionalServices.add(clientAdditionalService);
    }
    public void removeClientAdditionalService(ClientAdditionalService clientAdditionalService){
        clientAdditionalServices.remove(clientAdditionalService);
    }
    public void removeResidence(Residence residence){
        residences.remove(residence);
    }
    public void setResidences(Set<Residence> residences) {
        this.residences = residences;
    }

    public Set<ClientAdditionalService> getClientAdditionalServices() {
        return clientAdditionalServices;
    }

    public void setClientAdditionalServices(Set<ClientAdditionalService> clientAdditionalServices) {
        this.clientAdditionalServices = clientAdditionalServices;
    }

    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getPassportData() {
        return passportData;
    }

    public void setPassportData(String passportData) {
        this.passportData = passportData;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Client{" +
                "fio='" + fio + '\'' +
                ", passportData='" + passportData + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
