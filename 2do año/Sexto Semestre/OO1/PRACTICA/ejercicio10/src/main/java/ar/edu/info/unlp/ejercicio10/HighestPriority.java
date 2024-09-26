package ar.edu.info.unlp.ejercicio10;

public class HighestPriority extends JobScheduler{

    public HighestPriority() {
        super();
    }
    
    protected JobDescription nextJob() {
        return jobs.stream()
                .max((j1,j2) -> Double.compare(j1.getPriority(), j2.getPriority()))
                .orElse(null);    
    }
}