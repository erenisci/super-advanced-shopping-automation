import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class sifre {

    private static Map<String, String> kullaniciSifreleri = new HashMap<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Kullanıcı adı ve şifreleri al
        System.out.print("Kullanıcı adınızı girin: ");
        String kullaniciAdi = scanner.nextLine();
        System.out.print("Şifrenizi girin: ");
        String sifre = scanner.nextLine();

        // Şifreyi hashleyerek sakla
        String hashliSifre = hashleSifre(sifre);
        kullaniciSifreleri.put(kullaniciAdi, hashliSifre);

        // Giriş için tekrar kullanıcı adı ve şifre iste
        System.out.print("Kullanıcı adınızı girin: ");
        String girisAdi = scanner.nextLine();
        System.out.print("Şifrenizi girin: ");
        String girisSifre = scanner.nextLine();

        // Girişi doğrula
        if (kullaniciDogrula(girisAdi, girisSifre)) {
            System.out.println("Giriş başarılı!");
        } else {
            System.out.println("Kullanıcı adı veya şifre hatalı.");
        }
    }

    public static String hashleSifre(String sifre) {
        try {
            // SHA-256 algoritması ile MessageDigest oluştur
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Şifreyi byte dizisine çevir
            byte[] hashedBytes = digest.digest(sifre.getBytes());

            // Byte dizisini hexadecimal formatına çevir
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean kullaniciDogrula(String kullaniciAdi, String girisSifre) {
        // Kullanıcı adı ve şifreyi kontrol et
        return kullaniciSifreleri.containsKey(kullaniciAdi)
                && kullaniciSifreleri.get(kullaniciAdi).equals(hashleSifre(girisSifre));
    }
}