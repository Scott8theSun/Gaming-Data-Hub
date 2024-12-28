package oldClasses;

/**
 * Developer class to represent columns in the
 * developer SQL table.
 */
public class Developer {
    private Integer developerID; //Primary Key
    private String name;
    private String email;
    private String developerDesc;

    public Developer(){
        this.developerID = null;
        this.name = null;
        this.email = null;
        this.developerDesc = null;
    }
    public Developer(Integer developerID, String name, String email, String developerDesc){
        this.developerID = developerID;
        this.name = name;
        this.email = email;
        this.developerDesc = developerDesc;
    }

    /**
     * Getter Methods
     */
    public Integer getDeveloperID(){
            return this.developerID;
        }
    public String getName(){
        return this.name;
    }
    public String getEmail(){
        return this.email;
    }
    public String getDeveloperDesc(){
        return this.developerDesc;
    }

    /**
     *  Setter Methods
     */
    public void setDeveloperID(Integer developerID) {
            this.developerID = developerID;
        }
        public void setName(String name) {
            this.name = name;
        }
        public void setEmail(String email) {
            this.email = email;
        }
        public void setDeveloperDesc(String developerDesc) {
            this.developerDesc = developerDesc;
        }

}
