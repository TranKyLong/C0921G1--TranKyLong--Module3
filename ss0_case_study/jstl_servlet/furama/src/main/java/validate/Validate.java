package validate;

import model.Customer;
import model.CustomerType;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.ResolverStyle;


public class Validate {
    private static final String REGEX_CUSTOMER_ID = "^(KH-)\\d{4}$";
    private static final String REGEX_NAME = "^[A-Za-z\\s]*$";
    private static final String REGEX_PHONE = "^(09|\\(84\\)\\+9)[01]\\d{7}$";
    private static final String REGEX_ID_CARD = "^\\d{9}|\\d{12}$";
    private static final String REGEX_EMAIL = "^\\w{3,}(\\.?\\w+)*@[a-z]{2,7}(.[a-z]{2,5}){1,3}$";

    public static boolean regexDate(final String date) {
        boolean valid = false;
        try {
            LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd").withResolverStyle(ResolverStyle.STRICT));
            valid = true;
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            valid = false;
        }
        return valid;
    }

    public static boolean regexName(String name) {

        if (name.matches(REGEX_NAME)) {
            return true;
        }
        return false;
    }

    public static boolean regexGender(int gender) {
        if (gender != -1) {
            return true;
        }
        return false;
    }

    public static boolean regexType(CustomerType type) {
        if (type.getCustomerTypeID() < 1) {
            return false;
        }
        return true;
    }

    public static boolean regexMail(String mail) {

        if (mail.matches(REGEX_EMAIL)) {
            return true;
        }
        return false;
    }

    public static boolean regexPhone(String phone) {
        if (phone.matches(REGEX_PHONE)) {
            return true;
        }
        return false;
    }

    public static boolean regexIdCard(String idCard) {
        if (idCard.matches(REGEX_ID_CARD)) {
            return true;
        }
        return false;
    }
}