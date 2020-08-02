package com.timemanagement.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/** SHA_512 Encryption
 **/
public class HasherService {

    public static HasherService instance = new HasherService();

    private static byte x = Byte.parseByte("23");
    private static byte[] salt = {x};

    private HasherService(){}

    public static HasherService getInstance(){
        return instance;
    }

    public static String hash(String passwordToHash){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt);
            byte[] bytes = md.digest(passwordToHash.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < bytes.length ;i ++){
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public boolean checkPassword(String hash, String attempt){
        String generatedHash = hash(attempt);
        return hash.equals(generatedHash);
    }
}