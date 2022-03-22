<aura:application>
    <aura:attribute name="Message" type="string" default="Salesforce lightning Application Bundle"/>
    
    <div class="messageStyles">
        {! v.Message} <br/><br/>
    </div>
    
    <lightning:button label="ShowMessage" variant="brand" onclick="{!c.ShowMessage}"/> <br/><br/>
    
</aura:application>