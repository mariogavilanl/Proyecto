
package cl.proyecto.proyecto;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories(basePackages = "cl.proyecto.proyecto.Repository")
@EntityScan(basePackages = "cl.proyecto.proyecto.Entity")
@Configuration
public class JpaConfig {
}