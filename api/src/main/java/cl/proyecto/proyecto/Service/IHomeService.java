package cl.proyecto.proyecto.Service;

import java.util.List;

import cl.proyecto.proyecto.DTO.DepartamentoSituacionDTO;
import cl.proyecto.proyecto.Entity.EstSituacion;
import cl.proyecto.proyecto.Entity.OrgDepartamento;
import cl.proyecto.proyecto.Entity.SituacionDepartamento;

public interface IHomeService {
    List<SituacionDepartamento> getAllSituacionesDepartamento();
    SituacionDepartamento getSituacionDepartamentoById(Integer id);
    List<EstSituacion> getAllEstSituaciones();
    List<OrgDepartamento> getAllDepartamentos();
}
