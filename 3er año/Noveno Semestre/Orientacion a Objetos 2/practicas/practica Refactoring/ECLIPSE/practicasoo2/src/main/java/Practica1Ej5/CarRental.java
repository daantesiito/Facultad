package Practica1Ej5;

public class CarRental extends Product {
    private Company company;

    public CarRental(double cost, Company company, TimePeriod timePeriod) {
    	super(timePeriod, cost);
        this.company = company;
    }

    public double price() {
        return this.company.price() * this.company.promotionRate();
    }

}
