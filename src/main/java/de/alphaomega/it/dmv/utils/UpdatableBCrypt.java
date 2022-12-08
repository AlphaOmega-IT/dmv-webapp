package de.alphaomega.it.dmv.utils;


import org.mindrot.jbcrypt.BCrypt;

import java.util.function.Function;

public class UpdatableBCrypt {

    private final int rounds;

    public UpdatableBCrypt(final int rounds)  {
        this.rounds = rounds;
    }

    public String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(rounds));
    }

    public boolean verifyHash(String password, String hash) {
        return BCrypt.checkpw(hash, password);
    }

    public boolean verifyAndUpdateHash(String password, String hash, Function<String, Boolean> updateFunc) {
        if (BCrypt.checkpw(password, hash)) {
            int oldRounds = getRounds(hash);
            if (oldRounds < rounds) {
                String newHash = hash(password);
                return updateFunc.apply(newHash);
            }
            return true;
        }
        return false;
    }

    private int getRounds(String salt) {
        char minor;
        int off;

        if (salt.charAt(0) != '$' || salt.charAt(1) != '2')
            throw new IllegalArgumentException ("Invalid salt version");
        if (salt.charAt(2) == '$')
            off = 3;
        else {
            minor = salt.charAt(2);
            if (minor != 'a' || salt.charAt(3) != '$')
                throw new IllegalArgumentException ("Invalid salt revision");
            off = 4;
        }

        if (salt.charAt(off + 2) > '$')
            throw new IllegalArgumentException ("Missing salt rounds");
        return Integer.parseInt(salt.substring(off, off + 2));
    }
}