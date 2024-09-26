package ar.edu.info.unlp.ejercicio10;

public class Lifo extends JobScheduler {
    
    public Lifo() {
        super();
    }
    
    protected JobDescription nextJob() {
        return jobs.get(jobs.size()-1);    
    }
}