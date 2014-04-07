<cfcomponent restpath="/articles" rest="true">

	<cffunction localmode="modern" access="remote" name="getArticleSummary" httpMethod="GET" >
		<cfquery name="articles" datasource="clarkiei_main">
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
		<cfquery name="article" datasource="clarkiei_main">
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

	<cffunction name="save">
		<cfargument name="articleId" required="false" default="">
		<cfargument name="title" required="false" default="">
		<cfargument name="summary" required="false" default="">
		<cfargument name="body" required="false" default="">

		<cfif val(arguments['articleId'])>
			<!--- do update --->
			<cfquery name="updArticle" datasource="clarkiei_main">
				UPDATE article
				SET
					title = <cfqueryparam value="#arguments['title']#" cfsqltype="cf_sql_varchar">,
					summary = <cfqueryparam value="#arguments['summary']#" cfsqltype="cf_sql_varchar">,
					body = <cfqueryparam value="#arguments['body']#" cfsqltype="cf_sql_varchar">
				WHERE
					id = <cfqueryparam value="#arguments['articleId']#" cfsqltype="cf_sql_integer">
			</cfquery>
		<cfelse>
			<!--- do insert --->
			<cfquery name="insArticle" datasource="clarkiei_main">
				INSERT INTO article (title,summary,body) VALUES (
					<cfqueryparam value="#arguments['title']#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments['summary']#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments['body']#" cfsqltype="cf_sql_varchar">
				)
			</cfquery>
		</cfif>

	</cffunction>

</cfcomponent>