package model;

public class Doctor {


			private int ID;
			private String name ;
			private int age ;
			private String qualification ;
			private String specialization ;
			private String hospital;
			private String Gender ;
			private String language ;
			
			
			
			public Doctor(int ID,String name, int age, String qualification, String specialization, String hospital,
					String gender, String language) {
				super();
				this. ID=ID;
				this.name = name;
				this.age = age;
				this.qualification = qualification;
				this.specialization = specialization;
				this.hospital = hospital;
				Gender = gender;
				this.language = language;
			}
			
			
			
			public Doctor(){
				ID=0;	
				name="";
				age = 0;
				qualification = "";
				specialization = "";
				hospital ="";
				Gender = "";
				language ="";
			}



			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public int getAge() {
				return age;
			}
			public void setAge(int age) {
				this.age = age;
			}
			public String getQualification() {
				return qualification;
			}
			public void setQualification(String qualification) {
				this.qualification = qualification;
			}
			public String getSpecialization() {
				return specialization;
			}
			public void setSpecialization(String specialization) {
				this.specialization = specialization;
			}
			public String getHospital() {
				return hospital;
			}
			public void setHospital(String hospital) {
				this.hospital = hospital;
			}
			public String getGender() {
				return Gender;
			}
			public void setGender(String gender) {
				Gender = gender;
			}
			public String getLanguage() {
				return language;
			}
			public void setLanguage(String language) {
				this.language = language;
			}



			public int getID() {
				return ID;
			}



			public void setID(int iD) {
				ID = iD;
			}

			
			
			
		   
	

}
