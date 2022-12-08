package de.alphaomega.it.dmv.utils;

public class BCryptUtil {

    private static final UpdatableBCrypt bcrypt = new UpdatableBCrypt(10);

    public static String hash(String password) {
        return bcrypt.hash(password);
    }

    public static boolean verifyAndUpdateHash(String password, String hash) {
        return bcrypt.verifyHash(hash, password);
    }
}