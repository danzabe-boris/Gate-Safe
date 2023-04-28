package com.gate.gatesafe.jaas;

import java.security.*;

public class PasswordSecure {
//    byte[] salt;
    String pass = null;

    public PasswordSecure(String str) throws NoSuchAlgorithmException {
//        this.salt = getSalt();
        this.pass = getSecurePassword(str);
    }

    public String getPass() {
        return pass;
    }

    public static String getSecurePassword(String password){
        String generatedPassword = null;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
//            md.update(salt);

            byte[] bytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

//    private static byte[] getSalt() throws NoSuchAlgorithmException {
//        SecureRandom random = new SecureRandom();
//        byte[] salt = new byte[16];
//        random.nextBytes(salt);
//        return salt;
//    }
}
