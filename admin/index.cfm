<cfif not( structKeyExists(session,'loggedIn') and session.loggedIn ) >
	<cflocation addtoken="false" url="/">
</cfif>

<cfset a = new lib.article()>

<cfif structKeyExists(form,'body')>
	<cfset args = {
		title: form.title,
		body: form.body,
		summary: form.summary
		}>
	<cfif structKeyExists(form,'articleId') and val(form['articleId'])>
		<cfset args['articleId'] = form.articleId>
	</cfif>
	<cfset a.save(argumentCollection = args)>
</cfif>

<cfset thisArticle = {
		id : '',
		title : '',
		summary: '',
		body: '',
		published: 'Draft'
	}>

<cfif structKeyExists(url,'articleId') and val(url.articleId)>
	<!--- get the article from the db --->

	<cfset thisArticle = a.getArticle(url.articleId)>

	<cfdump var="#thisArticle#" />

</cfif>


<html>

	<head>
		<script src="/ckeditor/ckeditor.js"></script>
		<link rel="stylesheet" href="/css/bootstrap.min.css">
	</head>


	<body>
		<cfoutput>
			<form class="form-horizontal" method="post">

				<cfif structKeyExists(url,'articleId')>
					<input type="text	" value="#url.articleId#" name="articleId">
				</cfif>

				<fieldset>
				<!-- Form Name -->
					<legend>Add / Edit article</legend>

					<!-- Text input-->
					<div class="control-group">
						<label class="control-label" for="title">Title</label>
						<div class="controls">
							<input id="title" name="title" type="text" placeholder="title" class="input-xlarge" required="" value="#thisArticle.title#">
						</div>
					</div>

					<!-- Textarea -->
					<div class="control-group">
						<label class="control-label" for="summary">Summary</label>
						<div class="controls">
							<textarea id="summary" name="summary">#thisArticle.summary#</textarea>
						</div>
					</div>

					<!-- Textarea -->
					<div class="control-group">
						<label class="control-label" for="body">Body</label>
						<div class="controls">
							<textarea id="body" name="body">#thisArticle.body#</textarea>
						</div>
					</div>

					<!-- Multiple Radios (inline) -->
					<div class="control-group">
						<label class="control-label" for="publish">Publish?</label>
						<div class="controls">
							<label class="radio inline" for="publish-0">
								<input type="radio" name="publish" id="publish-0" value="Draft" checked="checked" required="required">
								Draft
							</label>
							<label class="radio inline" for="publish-1">
								<input type="radio" name="publish" id="publish-1" value="Published" required="required">
								Published
							</label>
						</div>
					</div>

					<!-- Button -->
					<div class="control-group">
						<label class="control-label" for="submit"></label>
						<div class="controls">
							<button id="submit" name="submit" class="btn btn-primary">Save</button>
						</div>
					</div>

				</fieldset>
			</form>
		</cfoutput>

		<script>
			CKEDITOR.replace( 'summary' );
			CKEDITOR.replace( 'body' );
		</script>
	</body>

</html>

