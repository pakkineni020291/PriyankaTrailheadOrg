({
    createItem: function(component, item) {
        var action = component.get("c.saveItem");
        action.setParams({
            "Item": Item
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var Items = component.get("v.Items");
                Items.push(response.getReturnValue());
                component.set("v.Items", Items);
            }
        });
        $A.enqueueAction(action);
    }
})