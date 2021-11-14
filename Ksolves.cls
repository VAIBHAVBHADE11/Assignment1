public class Ksolves {
    public string selectInstValue{get;set;}
    public list<selectoption> instituteListDis{get;set;}
    public List<Mentor__c> mentorList{get;set;}
    public Boolean displayMentor {get; set;}
    public List<Student__c> studentList{get;set;}
    public string selectId{get;set;}
   
    public Ksolves(){
        selectInstValue = '';
        displayMentor=false;
        instituteListDis = new list<selectOption>();
        instituteListDis.add(new selectOption('','Select Institute'));
        List<Institute__c> instList = new List<Institute__c>();
        instList = [select name from Institute__c order by name];
        for(Institute__c inst : instList) {
            instituteListDis.add(new selectOption(inst.id,inst.name));
        }
    }
    public pagereference displayMentors() {
        displayMentor=true;
        mentorList = [SELECT ID, Name, Designation__c FROM Mentor__c where Institute__r.id = :selectInstValue];
        return null;
    }
      public pagereference showStudentsDetails() {
        studentList = [SELECT ID, Name, Class__c,City__c,state__c,Address__c,Pin_code__c,Aadhaar_Number__c FROM Student__c where Mentor__r.id = :selectId ];
        return null;
    }
   
}