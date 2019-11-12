
<cfscript>
// challenge 1
/* 
    get a feed from a collection using a bean
    iterate over collection and display associated image
*/
local.feed = m.getBean('feed').loadBy(name='From Our Blog');
local.iterator = local.feed.getIterator();

while (local.iterator.hasNext()) { 
  local.item = local.iterator.next();
  writeOutput('<img src="#local.item.getImageURL('small')#" >')
}

</cfscript>

<!--- AS CFML -->
<cfoutput> 
<cfloop condition="local.iterator.hasNext()">
    <cfset local.item=local.iterator.next()>
     <img src="#local.item.getImageURL('small')#" >
</cfloop> 
</cfoutput>
--->
