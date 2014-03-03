<cfcomponent restpath="/articles" rest="true">
	<cfset variables.tempData = [{"id": 1, "title": "Technical Debt", "body": "How do you prevent your code from falling off the cliff?" }
			,{"id": 2, "title": "I love graphs!", "body": "Graphite and statsd intro at ConcretePlatform" }
			,{"id": 3, "title": "Delete code", "body": "Fisheye and deleteing code. 16 million lines of code to 750k" }
			,{"id": 4, "title": "Database Analysis", "body": "Looking at optimisation techniques from an outsiders point of view xdxdxfxfdxffdxfdx" }]
			>

	<cffunction localmode="modern" access="remote" name="getArticleSummary" httpMethod="GET" >
		<cfquery name="articles">
			SELECT id, title, body, summary, create_date FROM article
		</cfquery>
		<cfset ret = []>
		<cfloop query="articles">
			<cfset ret.append({
					'id' : articles.id,
					'title' : articles.title,
					'body' : articles.body,
					'summary' : articles.summary,
					'createDate' : articles.create_date

				})>
		</cfloop>

		<cfreturn ret>

	</cffunction>

	<cffunction localmode="modern" access="remote" name="getArticle" httpMethod="GET" restPath="{a}">
		<cfargument name="a" restargsource="path">
		<cfquery name="article">
			SELECT id, title, body, summary, create_date FROM article
			WHERE id = <cfqueryparam value="#arguments['a']#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfset ret = {
					'id' : article.id,
					'title' : article.title,
					'body' : article.body,
					'summary' : article.summary,
					'createDate' : article.create_date

				}>
		<cfreturn ret>
	</cffunction>

</cfcomponent>