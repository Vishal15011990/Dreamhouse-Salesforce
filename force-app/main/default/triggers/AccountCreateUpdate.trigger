trigger AccountCreateUpdate on Account (after insert) {
    CreateAccountAfter.insertandcreateanotheraccount(Trigger.new);

}