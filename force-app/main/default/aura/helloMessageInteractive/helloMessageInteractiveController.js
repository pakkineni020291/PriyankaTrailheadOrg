({
	handleClick : function(component, event, helper) {
        var btnClicked = event.getSource();
        
        var btnMessage = btnClicked.get("v.label");
        var compname = component.get("v.type");
        component.set("v.message", btnMessage);
        component.set("v.message", compname);
        
		
	}
})