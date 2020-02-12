trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {
    if(trigger.isInsert){
        List<Language_Course__c> courses = new List<Language_Course__c>();
        for(Language_Course__c course : [SELECT Id, Name FROM Language_Course__c WHERE Id IN :trigger.New]){
            courses.add(new Language_Course__c(Id = course.id,
                                               Name = course.Name + ' inserted'));
        }
        update courses;
    }
}