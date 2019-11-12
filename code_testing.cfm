<cfoutput>
<!DOCTYPE html>
<html lang="en">
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="template py-5">
			<div class="container">
				<cfinclude template="inc/breadcrumb.cfm" />
				<div class="row">
					<section class="col-md-12 col-lg-8 col-xl-9 content">
				
						<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
						#$.dspBody(
							body=$.content('body')
							, pageTitle=pageTitle
							, crumbList=false
							, showMetaImage=false
						)#

                        <cfinclude template="cfsnippets/display_categories-pages_using_vue.cfm" />
						
			    </section>
				</div><!--- /.row --->
			</div><!--- /.container --->
		</div>
		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</body>
</html>
</cfoutput>



