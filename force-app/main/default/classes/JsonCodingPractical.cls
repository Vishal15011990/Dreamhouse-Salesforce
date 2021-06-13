public with sharing class JsonCodingPractical{
	public static void codingPractical(){

		list<account> accountList = [SELECT Id, Name, AccountNumber, Industry, Rating
		                             from Account
		                             limit 5];

		string accJSON = JSON.serialize(accountList[0]);
		//system.debug('accJSON'+accJSON);

		Account acc2 = (Account)json.deserialize(accJSON, Account.class);
		system.debug('acc' + acc2);

		if (accountList != NULL && accountList.size() > 0)
        {
			JSONGenerator gen = JSON.createGenerator(true);
			gen.writeStartObject();//{
			gen.writeFieldName('AccountList');
			gen.writeStartArray();

			for (Account acc : accountList)
            {
				gen.writeStartObject();
				string accid = acc.id;
				gen.writeStringField('Id', accid);

				string accName = acc.Name != NULL ? acc.Name : '';
				gen.writeStringField('Name', accName);

				string accNumber = acc.AccountNumber != NULL ? acc.AccountNumber : '';
				gen.writeStringField('AccountNumber', accNumber);

				string accind = acc.Industry != NULL ? acc.Industry : '';
				gen.writeStringField('Industry', accind);

				string accRating = acc.Rating != NULL ? acc.Rating : '';
				gen.writeStringField('Rating', accRating);

				gen.writeEndObject();
			}
			gen.writeEndArray();
			gen.writeEndObject();

			string jSONString = gen.getAsString();
			system.debug('JSONString' + jSONString);

		}
    }
}