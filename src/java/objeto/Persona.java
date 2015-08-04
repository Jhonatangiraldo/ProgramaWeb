package objeto;
public class Persona {
    public String nombre;
    public int cedula;
    private int facultad;
    private int carrera;
    
    public String getNombre()
    {
        return this.nombre;
    }
    
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }
    
    public int getCedula()
    {
        return this.cedula;
    }
    
    public void setCedula(int cedula)
    {
        this.cedula = cedula;
    }

    public int getFacultad() {
        return facultad;
    }

    public void setFacultad(int facultad) {
        this.facultad = facultad;
    }

    public int getCarrera() {
        return carrera;
    }

    public void setCarrera(int carrera) {
        this.carrera = carrera;
    }
}
