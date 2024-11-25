package cl.proyecto.proyecto.Service;

import org.springframework.stereotype.Service;

import cl.proyecto.proyecto.DTO.DepartamentoSituacionDTO;
import cl.proyecto.proyecto.Entity.EstSituacion;
import cl.proyecto.proyecto.Entity.OrgDepartamento;
import cl.proyecto.proyecto.Entity.SituacionDepartamento;
import cl.proyecto.proyecto.Repository.BscRSituacionDepartamentoRepository;
import cl.proyecto.proyecto.Repository.EstSituacionRepository;
import cl.proyecto.proyecto.Repository.OrgDepartamentoRepository;

import java.util.List;

@Service
public class HomeService implements IHomeService{

    private final BscRSituacionDepartamentoRepository bscRSituacionDepartamentoRepository;
    private final EstSituacionRepository estSituacionRepository;
    private final OrgDepartamentoRepository orgDepartamentoRepository;

    public HomeService(
        BscRSituacionDepartamentoRepository bscRSituacionDepartamentoRepository,
        EstSituacionRepository estSituacionRepository,
        OrgDepartamentoRepository orgDepartamentoRepository
    ) {
        this.bscRSituacionDepartamentoRepository = bscRSituacionDepartamentoRepository;
        this.estSituacionRepository = estSituacionRepository;
        this.orgDepartamentoRepository = orgDepartamentoRepository;
    }

    // Métodos para interactuar con BscRSituacionDepartamento
    public List<SituacionDepartamento> getAllSituacionesDepartamento() {
        return bscRSituacionDepartamentoRepository.findAll();
    }

    public SituacionDepartamento getSituacionDepartamentoById(Integer id) {
        return bscRSituacionDepartamentoRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Situación Departamento no encontrada con ID: " + id));
    }

    // Métodos para interactuar con EstSituacion
    public List<EstSituacion> getAllEstSituaciones() {
        return estSituacionRepository.findAll();
    }

    // Métodos para interactuar con OrgDepartamento
    public List<OrgDepartamento> getAllDepartamentos() {
        return orgDepartamentoRepository.findAll();
    }

    public List<DepartamentoSituacionDTO> findDepartamentoSituacionWithVotes(){

        return this.bscRSituacionDepartamentoRepository.findDepartamentoSituacionWithVotes();

    }
    
   
}
