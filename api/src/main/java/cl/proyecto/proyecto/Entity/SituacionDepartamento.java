package cl.proyecto.proyecto.Entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "bsc_r_situacion_departamento", schema = "public")
public class SituacionDepartamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "org_departamento_id", nullable = false)
    private OrgDepartamento orgDepartamento;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "est_situacion_id", nullable = false)
    private EstSituacion estSituacion;

    @Column(nullable = false)
    private boolean incluir;

    @Column(name = "fecha_registro", nullable = false)
    private LocalDate fechaRegistro;

    // Getters y setters
}