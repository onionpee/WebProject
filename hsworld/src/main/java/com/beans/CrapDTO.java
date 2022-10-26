package com.beans;

public class CrapDTO {
   
   private int CR_UID;
   private String CR_TITLE;
   private String CR_CONTENT;
   private int CR_VIEWCNT;
   private String CR_DATE;
   private String CR_USER;
   private String CR_HOSNAME;
   
   
   
   public String getCR_HOSNAME() {
	return CR_HOSNAME;
}

public void setCR_HOSNAME(String cR_HOSNAME) {
	CR_HOSNAME = cR_HOSNAME;
}

private int NT_UID;
   private String NT_TITLE;
   private String NT_CONTENT;
   private int NT_VIEWCNT;
   private String NT_DATE;
   
   
   public CrapDTO() {
      super();
   }
   
   public CrapDTO(int CR_UID, String CR_TITLE, String CR_CONTENT, String CR_HOSNAME, int CR_VIEWCNT, String CR_DATE, String CR_USER) {
	   super();
	   this.CR_UID = CR_UID;
	   this.CR_TITLE = CR_TITLE;
	   this.CR_CONTENT = CR_CONTENT;
	   this.CR_HOSNAME = CR_HOSNAME;
	   this.CR_VIEWCNT = CR_VIEWCNT;
	   this.CR_DATE = CR_DATE;
	   this.CR_USER = CR_USER;
   }
   
   public CrapDTO(int CR_UID, String CR_TITLE, String CR_CONTENT, int CR_VIEWCNT, String CR_DATE, String CR_USER) {
      super();
      this.CR_UID = CR_UID;
      this.CR_TITLE = CR_TITLE;
      this.CR_CONTENT = CR_CONTENT;
      this.CR_VIEWCNT = CR_VIEWCNT;
      this.CR_DATE = CR_DATE;
      this.CR_USER = CR_USER;
   }
   
   public CrapDTO(int NT_UID, String NT_TITLE, String NT_CONTENT, int NT_VIEWCNT, String NT_DATE) {
	   super();
	   this.NT_UID = NT_UID;
	   this.NT_TITLE = NT_TITLE;
	   this.NT_CONTENT = NT_CONTENT;
	   this.NT_VIEWCNT = NT_VIEWCNT;
	   this.NT_DATE = NT_DATE;
   }
   
   public int getNT_UID() {
	   return NT_UID;
   }
   
   public void setNT_UID(int NT_UID) {
	   this.NT_UID = NT_UID;
   }

   
   public String getNT_TITLE() {
	return NT_TITLE;
	}
	
	public void setNT_TITLE(String nT_TITLE) {
		NT_TITLE = nT_TITLE;
	}
	
	public String getNT_CONTENT() {
		return NT_CONTENT;
	}
	
	public void setNT_CONTENT(String nT_CONTENT) {
		NT_CONTENT = nT_CONTENT;
	}
	
	public int getNT_VIEWCNT() {
		return NT_VIEWCNT;
	}
	
	public void setNT_VIEWCNT(int nT_VIEWCNT) {
		NT_VIEWCNT = nT_VIEWCNT;
	}
	
	public String getNT_DATE() {
		return NT_DATE;
	}
	
	public void setNT_DATE(String nT_DATE) {
		NT_DATE = nT_DATE;
	}
	
	public int getCR_UID() {
	      return CR_UID;
	   }
	   
   public void setCR_UIT(int CR_UID) {
      this.CR_UID = CR_UID;
   }
   
   public String getCR_TITLE() {
      return CR_TITLE;
   }
   
   public void setCR_TITLE(String CR_TITLE) {
      this.CR_TITLE = CR_TITLE;
   }
   
   public String getCR_CONTENT() {
      return CR_CONTENT;
   }
   
   public void setCR_CONTENT(String CR_CONTENT) {
      this.CR_CONTENT = CR_CONTENT;
   }
   
   public int getCR_VIEWCNT() {
      return CR_VIEWCNT;
   }
   
   public void setCR_VIEWCNT(int CR_VIEWCNT) {
      this.CR_VIEWCNT = CR_VIEWCNT;
   }
   
   public String getCR_DATE() {
      return CR_DATE;
   }
   
   public void setCR_DATE(String CR_DATE) {
      this.CR_DATE = CR_DATE;
   }

   public String getCR_USER() {
      return CR_USER;
   }

   public void setCR_USER(String CR_USER) {
      this.CR_USER = CR_USER;
   }
   
   
   
//   public String getCR_DATETIME() {
//      if(this.CR_DATE == null) return "";
//      return this.CR_DATE.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"));
//   }

}