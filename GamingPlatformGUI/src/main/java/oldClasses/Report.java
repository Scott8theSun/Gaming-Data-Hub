package oldClasses;

/**
 * Report Class to represent the columns in
 * the report SQL table.
 */
public class Report {
        private Integer reportID;    //Primary key
        private Integer reporterID;  //Foreign key - (PlayerID)
        private Integer offenderID;  //Foreign key - (PlayerID)
        private String reportDesc;
        private String reportStatus; //Only values "Pending" or "Resolved"

    public Report() {
        this.reportID = null;
        this.reporterID = null;
        this.offenderID = null;
        this.reportDesc = null;
        this.reportStatus = null; // default status
    }
    public Report(Integer reportID, Integer reporterID, Integer offenderID, String reportDesc, String reportStatus) {
        this.reportID = reportID;
        this.reporterID = reporterID;
        this.offenderID = offenderID;
        this.reportDesc = reportDesc;
        this.reportStatus = reportStatus;
    }

    /**
     * Getter Methods
     */
    public Integer getReportID() {
        return reportID;
    }
    public Integer getReporterID() {
        return reporterID;
    }
    public Integer getOffenderID() {
        return offenderID;
    }
    public String getReportDesc() {
        return reportDesc;
    }
    public String getReportStatus() {
        return reportStatus;
    }

    /**
     * Setter Methods
     */
    public void setReportID(Integer reportID) {
        this.reportID = reportID;
    }
    public void setReporterID(Integer reporterID) {
        this.reporterID = reporterID;
    }
    public void setOffenderID(Integer offenderID) {
        this.offenderID = offenderID;
    }
    public void setReportDesc(String reportDesc) {
        this.reportDesc = reportDesc;
    }
    public void setReportStatus(String reportStatus) {
        this.reportStatus = reportStatus;
    }
}
