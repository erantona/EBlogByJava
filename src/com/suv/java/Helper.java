package com.suv.java;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String path) {
        boolean test = false;
        try {
            File file = new File(path);
            test = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

}
