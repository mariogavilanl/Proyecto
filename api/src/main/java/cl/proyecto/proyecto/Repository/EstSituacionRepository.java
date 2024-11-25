package cl.proyecto.proyecto.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.proyecto.proyecto.Entity.EstSituacion;

@Repository
public interface EstSituacionRepository extends JpaRepository<EstSituacion, Integer> {
    // Métodos adicionales si necesitas consultas específicas
}
