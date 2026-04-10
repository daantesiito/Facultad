package Practica1Ej5;

import java.time.LocalDate;

public class Product {
	
    protected TimePeriod timePeriod;
    protected double cost;
    
    public Product(TimePeriod timePeriod, double cost) {
    	this.timePeriod = timePeriod;
    	this.cost = cost;
    }
    
    public double getCost() {
    	return this.cost;
    }
    
    public void setCost(double cost) {
    	this.cost = cost;
    }
    

	public LocalDate startDate() {
        return this.timePeriod.start();
    }

    public LocalDate endDate() {
        return this.timePeriod.end();
    }
	
}
