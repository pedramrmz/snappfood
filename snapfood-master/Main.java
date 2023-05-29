
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.*;


class Assignment implements Serializable {

    HashMap<String,SnappFood> works = new HashMap<>();
}
class Topic implements Serializable {
    String name ;
    Topic(String name) {
        this.name = name ;
    }
}
class Class implements Serializable {
      String name ;
      String resturant ;
      String des ;
      ArrayList <User> teachers = new ArrayList<>() ;
      String code;
      ArrayList<User> foods = new ArrayList<>() ;
      ArrayList<Topic> topics = new ArrayList<>() ;
    Class(String name , String resturant , String des) {
        this.name = name;
        this.resturant = resturant ;
        this.des = des  ;
    }
}
class SnappFood implements Serializable {
    private Socket text = null;
    private DataInputStream  input = null;
    private DataOutputStream out= null;
}

class DataBase {
    static ArrayList <User> users;

    // Read Users
    static {
        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream("users.ser"))) {
            users = (ArrayList<User>) inputStream.readObject();
        } catch (IOException | ClassNotFoundException e) {
            users = new ArrayList<>();
        }
    }

    // Save Users
    static  void save() {
        try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream("users.ser"))) {
            outputStream.writeObject(users);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
class User implements Serializable {
    String username ;
    String password ;
    ArrayList<Class> classes = new ArrayList<>() ;
    User(String username , String password ) {
        this.username = username;
        this.password = password;
    }
}
class ClientHandler extends Thread{
    Socket s ;
    ObjectOutputStream oos ;
    ObjectInputStream ois;
    static private User findUser(String username, String password) {
        for (User user:DataBase.users) {
            if (user.username.equals(username) && user.password.equals(password))
                return user ;
        }
        return null ;
    }
    static private Boolean UserNameCheck(String username) {
        for(User user:DataBase.users) {
            if (user.username.equals(username))
                return false;
        }
        return true;
    }

    ClientHandler(Socket cs) {
        this.s = cs ;
    }
    @Override
    public void run() {
        try {
            ois = new ObjectInputStream(s.getInputStream());
            oos = new ObjectOutputStream(s.getOutputStream());
            String[] a = (String[])ois.readObject();
            System.out.println(a[0]);

            if(a[0].equals("Login")) {
                System.out.println("Check For Login");
                String username = a[1];
                String password = a[2];
                User user = findUser(username ,password) ;
                if (user !=null) {
                    System.out.println("Found");
                    oos.writeBoolean(true);
                    oos.flush();
                    oos.writeObject(user);
                    oos.flush();
                }



            }
            else if (a[0].equals("Register")) {
                System.out.println("Request For Register");
                String username = a[1];
                String password = a[2];
                byte[] imgByte = (byte[])ois.readObject();
                ByteArrayInputStream bis = new ByteArrayInputStream(imgByte);
                BufferedImage bImage2 = ImageIO.read(bis);
                if (bImage2 ==null) {
                    bImage2 = ImageIO.read(new File("avatar.jpg"));
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    ImageIO.write(bImage2, "jpg", bos );
                    imgByte= bos.toByteArray();
                    System.out.println("null image");
                }
                System.out.println(Arrays.toString(imgByte));
                User newUser = new User(username,password );
                DataBase.users.add(newUser) ;
                DataBase.save();

                oos.writeBoolean(true);
                oos.flush();
                oos.writeObject(newUser);
                oos.flush();
            }
            else if (a[0].equals("UserNameCheck")) {
                System.out.println("Check For Username");
                String username = a[1];
                oos.writeBoolean(UserNameCheck(username));
                oos.flush();
            }
            else if (a[0].equals("AddResturant")) {
                String username = a[1];
                String password = a[2];
                Class clas = new Class(a[3],a[4],a[5]) ;
                User user = findUser(username , password);
                if (user !=null) {
                    clas.teachers.add(user) ;
                    clas.code =  UUID.randomUUID().toString() ;
                    System.out.println(clas.code);
                    clas.topics.add(new Topic("No Topic"));
                    user.classes.add(clas);
                    DataBase.save();
                    System.out.println(clas.name);
                    oos.writeBoolean(true);
                    oos.flush();
                    oos.writeObject(clas);
                    oos.flush();
                }
                DataBase.save();
            }


            else if (a[0].equals("CreatedResturant")) {
                String code = a[1];
                String name = a[2];
                Topic topic = new Topic(name);
                DataBase.save();
            }
            else if (a[0].equals("EditFood")) {
                String code = a[1];
                String tname = a[2];
                String name = a[3] ;
                    }

                DataBase.save();

             if (a[0].equals("RemoveTopic From Resturant")) {
                String code = a[1];
                String name = a[2];



                DataBase.save();

            }
            else if (a[0].equals("Add Food")) {
                String username = a[1] ;
                String code = a[2];
                System.out.println(username);

                User user = null ;
                for (User us:DataBase.users) {
                    if (us.username.equals(username)) {
                        user = us;
                        break;
                    }

                }
                if (user == null){
                    oos.writeBoolean(false);
                    oos.flush();
                }
                else {
                    oos.writeBoolean(true);
                    oos.flush();
                }
                DataBase.save();
            }
                DataBase.save();
            oos.close();
            ois.close();
            s.close();
        }catch (Exception e){
            e.printStackTrace();
            DataBase.save();
        }

        System.out.println("Client Exited");
    }
}
public class Main {
    public static void main(String[] args) throws Exception {
        ServerSocket ss = new ServerSocket(8080) ;

        while (true) {
            Socket cs =  ss.accept();
            System.out.println("Client Connected");
            ClientHandler newClient =  new ClientHandler(cs);
            newClient.start();

        }
    }
}
