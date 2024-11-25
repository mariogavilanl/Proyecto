package cl.proyecto.proyecto.Repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cl.proyecto.proyecto.DTO.DepartamentoSituacionDTO;
import cl.proyecto.proyecto.Entity.SituacionDepartamento;

@Repository
public interface BscRSituacionDepartamentoRepository extends JpaRepository<SituacionDepartamento, Integer> {




    @Query("SELECT new cl.proyecto.proyecto.DTO.DepartamentoSituacionDTO(od.nombre, es.nombre, COUNT(bsd.id)) " +
    "FROM SituacionDepartamento bsd " +
    "JOIN bsd.OrgDepartamento od " +
    "JOIN bsd.EstSituacion es " +
    "GROUP BY od.nombre, es.nombre")
    List<DepartamentoSituacionDTO> findDepartamentoSituacionWithVotes();
}

