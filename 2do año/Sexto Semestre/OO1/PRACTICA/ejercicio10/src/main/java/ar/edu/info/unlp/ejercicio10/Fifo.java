package ar.edu.info.unlp.ejercicio10;

public class Fifo extends JobScheduler{
    
    public Fifo() {
        super();
    }
    
    protected JobDescription nextJob() {
        return jobs.get(0);    
    }
    
}