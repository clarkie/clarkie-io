
<cfdump var="#form#" />

<html>

	<head>
		<script src="/ckeditor/ckeditor.js"></script>
		<link rel="stylesheet" href="/css/bootstrap.min.css">
	</head>


	<body>

		<form method="post">
			<form class="form-horizontal">
		<fieldset>

		<!-- Form Name -->
		<legend>Add / Edit article</legend>

		<!-- Text input-->
		<div class="control-group">
		  <label class="control-label" for="title">Title</label>
		  <div class="controls">
		    <input id="title" name="title" type="text" placeholder="title" class="input-xlarge" required="">

		  </div>
		</div>

		<!-- Textarea -->
		<div class="control-group">
		  <label class="control-label" for="summary">Summary</label>
		  <div class="controls">
		    <textarea id="summary" name="summary"></textarea>
		  </div>
		</div>

		<!-- Textarea -->
		<div class="control-group">
		  <label class="control-label" for="body">Body</label>
		  <div class="controls">
		    <textarea id="body" name="body"></textarea>
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

		<script>
			CKEDITOR.replace( 'summary' );
		</script>
	</body>

</html>

