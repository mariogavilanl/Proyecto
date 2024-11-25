package cl.proyecto.proyecto.Entity;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "est_situacion", schema = "public")
public class EstSituacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "est_submodelo_id", nullable = false)
    private Integer estSubmodeloId;

    @Column(name = "bsc_objetivo_id", nullable = false)
    private Integer bscObjetivoId;

    @Column(name = "est_impacto_id", nullable = false)
    private Integer estImpactoId;

    @Column(name = "est_importancia_id", nullable = false)
    private Integer estImportanciaId;

    @Column(name = "est_urgencia_ud")
    private Integer estUrgenciaUd;

    @Column(nullable = false, length = 50)
    private String nombre;

    @Column(length = 5)
    private String alias;

    @Column(length = 500)
    private String descripcion;

    @Column
    private Integer orden;

    @Column(nullable = false)
    private boolean incluir;

    @Column(name = "fecha_registro", nullable = false)
    private LocalDate fechaRegistro;

    @Column(name = "est_urgencia_id")
    private Integer estUrgenciaId;

    // Getters y setters
}
