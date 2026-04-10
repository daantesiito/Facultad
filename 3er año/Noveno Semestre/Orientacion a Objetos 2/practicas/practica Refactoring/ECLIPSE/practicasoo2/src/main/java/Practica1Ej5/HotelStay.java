package Practica1Ej5;

public class HotelStay extends Product {
    private Hotel hotel;

    public HotelStay(double cost, Hotel hotel, TimePeriod timePeriod) {
    	super(timePeriod, cost);
        this.hotel = hotel;
    }

    public double priceFactor() {
        return this.cost / this.price(); // cambiar cost a QUOTE
    }

    public double price() {
        return this.timePeriod.duration() * this.hotel.nightPrice() * this.hotel.discountRate();
    }
}
