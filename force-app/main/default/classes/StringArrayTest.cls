public class StringArrayTest {
    public static List<String> generateStringArray(Integer no){
        List<String> Test=new List<String>();
        for(Integer n=0;n<no;n++){
            Test.add('Test ' +n);
            System.debug(Test[n]);
        }
      return Test;
    }
}