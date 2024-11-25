package cl.proyecto.proyecto.Entity;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "org_departamento", schema = "public")
public class OrgDepartamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "org_departamento_id_padre", nullable = false)
    private OrgDepartamento departamentoPadre;

    @Column(nullable = false)
    private Integer nivel;

    @Column(nullable = false, length = 50)
    private String nombre;

    @Column(nullable = false, length = 5)
    private String alias;

    @Column(length = 500)
    private String descripcion;

    @Column
    private Integer orden;

    @Column(name = "fecha_registro", nullable = false)
    private LocalDate fechaRegistro;

    // Getters y setters
}
