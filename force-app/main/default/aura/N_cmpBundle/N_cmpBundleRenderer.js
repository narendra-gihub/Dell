({
    //The framework calls render() function when component is being initialized/rendered. 
    render: function(cmp, helper) {
       helper.renderVal(cmp);
       return this.superRender()
    },
    //Rerender function will be called when a component’s value changes due to user action like a button click
    rerender: function(cmp, helper) {
        alert('Welcome to Rerender');
        return this.superRerender()
    }
})

/*
Render Types are:
1)render()
2)rerender()
3)afterRender()
4)unrender()
*/