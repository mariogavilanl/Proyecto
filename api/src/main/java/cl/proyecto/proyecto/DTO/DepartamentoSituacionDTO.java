package cl.proyecto.proyecto.DTO;




public class DepartamentoSituacionDTO {
    private String nombreDepartamento;
    private String nombreSituacion;
    private Integer idDepartamento;
    private Integer idSituacion;
    private Long cantidadVotos;

    // Constructor con los cinco parámetros
    public DepartamentoSituacionDTO(String nombreDepartamento, String nombreSituacion,
                                    Integer idDepartamento, Integer idSituacion, Long cantidadVotos) {
        this.nombreDepartamento = nombreDepartamento;
        this.nombreSituacion = nombreSituacion;
        this.idDepartamento = idDepartamento;
        this.idSituacion = idSituacion;
        this.cantidadVotos = cantidadVotos;
    }

    // Getters y Setters
    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }

    public String getNombreSituacion() {
        return nombreSituacion;
    }

    public void setNombreSituacion(String nombreSituacion) {
        this.nombreSituacion = nombreSituacion;
    }

    public Long getCantidadVotos() {
        return cantidadVotos;
    }

    public void setCantidadVotos(Long cantidadVotos) {
        this.cantidadVotos = cantidadVotos;
    }
}
