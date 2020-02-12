@IsTest
private class TestLanguageCourseTrigger {
    @IsTest
    static void afterInsertTest() {
        Language_Course_Instructor__c instructor = new Language_Course_Instructor__c(Name = 'Test Instructor');
        insert instructor;
        Language_Course__c course = new Language_course__c();
        course.Name = 'Test course';
        course.Course_Instructor__c = instructor.id;
        System.debug(course);
        Test.startTest();
        insert course;
        Test.stopTest();
        course = [SELECT Id, Name FROM Language_Course__c WHERE Name =: 'Test course inserted' ];
        System.debug(course);
        System.assert(course.id != null);
        System.assertEquals('Test course inserted', course.Name);
    }
}
