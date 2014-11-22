import java.util.Calendar;

// how to run:
// compile using: javac CalendarApp.java
// run using: java CalendarApp

// objective: get the values of the current:
// year, month, day,

class CalendarApp {

	public static void main(String[] args) {

		// returns a Calendar object "whose calendar fields have been
		// initialized with the current date and time"
		Calendar currentCalendar = Calendar.getInstance();
		Integer year = currentCalendar.get(Calendar.YEAR);
		Integer month = currentCalendar.get(Calendar.MONTH);
		Integer day_of_month = currentCalendar.get(Calendar.DAY_OF_MONTH);
		System.out.println("Year is: " + year);
		System.out.println("Month is: " + month);
		System.out.println("Day of Month is: " + day_of_month);
	}
}
