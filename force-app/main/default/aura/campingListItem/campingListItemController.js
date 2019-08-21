({
    doInit : function(component, event, helper) {
        var mydate = component.get("v.item.Date__c");
        if(mydate){
            component.set("v.formatdate", new Date(mydate));
        }
    },
	packItem : function(component, event, helper) {
        var checkbox = component.get("v.item",true);
		checkbox.Packed__c = true;
		component.set("v.item",checkbox);
		event.getSource().set('v.disabled', true);
		
	}
    
})