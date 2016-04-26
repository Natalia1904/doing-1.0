package by.burim.doing.service.utils;

import java.util.Date;

public final class DateUtils {

	private DateUtils() {
		super();
	}

	public static java.sql.Date toSqlDate(Date utilDate) {
		long utilTime = utilDate.getTime();
		java.sql.Date sqlDate = new java.sql.Date(utilTime);

		return sqlDate;
	}
}
