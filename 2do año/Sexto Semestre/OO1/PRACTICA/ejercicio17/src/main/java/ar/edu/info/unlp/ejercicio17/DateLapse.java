package ar.edu.info.unlp.ejercicio17;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapse {

private LocalDate from;
private LocalDate to;

public DateLapse(LocalDate from, LocalDate to) {
	super();
	this.from = from;
	this.to = to;
}

public LocalDate getFrom() {
return from;
}

public LocalDate getTo() {
return to;
}

public int sizeInDays() {
return (int) this.from.until(to, ChronoUnit.DAYS);
}

public boolean includesDate(LocalDate other) {
return other.isAfter(this.from) && other.isBefore(this.to);
}

public boolean overlaps (DateLapse anotherDateLapse) {
	return (this.from.isBefore(anotherDateLapse.getTo()) && this.to.isAfter(anotherDateLapse.getFrom()));
}

}