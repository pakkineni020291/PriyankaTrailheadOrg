({
	clickReimbursed: function(component, event, helper) {
        var expense = component.get("v.expense"); //gets the expense
        var updateEvent = component.getEvent("updateExpense"); //create the event
        updateEvent.setParams({ "expense": expense }); //package the expense in the event
        updateEvent.fire(); //fire the event
        
    },
})