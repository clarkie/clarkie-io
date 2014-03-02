<cfcomponent restpath="/articles" rest="true">
	<cfset variables.tempData = [{"id": 1, "title": "Technical Debt", "body": "How do you prevent your code from falling off the cliff?" }
			,{"id": 2, "title": "I love graphs!", "body": "Graphite and statsd intro at ConcretePlatform" }
			,{"id": 3, "title": "Delete code", "body": "Fisheye and deleteing code. 16 million lines of code to 750k" }
			,{"id": 4, "title": "Database Analysis", "body": "Looking at optimisation techniques from an outsiders point of view xdxdxfxfdxffdxfdx" }]
			>

	<cffunction access="remote" name="getArticleSummary" httpMethod="GET">
		<cfreturn variables.tempData>
	</cffunction>

	<cffunction access="remote" name="getArticle" httpMethod="GET" restPath="{a}">
		<cfargument name="a" restargsource="path">
		<cfreturn variables.tempData[arguments['a']]>
	</cffunction>

</cfcomponent>