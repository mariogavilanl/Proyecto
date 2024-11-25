package cl.proyecto.proyecto.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.proyecto.proyecto.Entity.OrgDepartamento;

@Repository
public interface OrgDepartamentoRepository extends JpaRepository<OrgDepartamento, Integer> {
    // Métodos adicionales si necesitas consultas específicas
}
