package ar.edu.info.unlp.ejercicio10;

public class MostEffort extends JobScheduler{
    
    public MostEffort() {
        super();
    }
    
    protected JobDescription nextJob() {
        return jobs.stream()
                .max((j1,j2) -> Double.compare(j1.getEffort(), j2.getEffort()))
                .orElse(null);    
    }
}