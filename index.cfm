<!doctype html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Clarkie - That's me!</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<h1>Clarkie IO
		<small>
			<a href="#/" class="icon-stack">
						<i class="icon-home"></i>
					</a>
				<a href="https://www.linkedin.com/in/clarkie1" target="_blank" class="icon-stack">
						<i class="icon-linkedin"></i>
					</a>
					<a href="https://twitter.com/clarkieclarkie" target="_blank" class="icon-stack">
						<i class="icon-twitter"></i>
					</a>
					<a href="https://github.com/clarkie" target="_blank" class="icon-stack">
						<i class="icon-github"></i>
					</a>
		</small>
		</h1>
		<hr />

		<div class="page row"></div>

		<div class="row">
			<p class="text-muted credit">&copy; copyright 2013. Clarkie. All Rights Reserved.</p>
		</div>



	</div>



	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/underscore.js" type="text/javascript"></script>
	<script src="js/backbone.js" type="text/javascript"></script>

	<script type="text/template" id="summary_template">

		<div class="lead">
			<p>I've talked about creating a site for myself for over 7 years. It all started with BashistBeats, a small project I created at university, a site dedicated to hosting my DJ mixes. This is the latest incarnation and will be home to my musings on various technical topics I'm working on.</p>
			<p>If you're interested in getting in touch feel free to drop me a message through one of the various social media links above.</p>
			<p>Clarkie</p>
			<hr>
		</div>

			<% _.each( siteSummary, function( article ){ %>
				<div class="col-xs-12 col-sm-6 col-md-4">
				<h3 class="text-primary"><i class="icon-bulb"></i><a href="#!/article/<%= article.get("id") %>"><%= article.get("title") %></a></h3>
				<p><%= article.get("summary") %></p>
				</div>
			<% }); %>

	</script>

	<script type="text/template" id="detail_template">
			<div class="col-xs-12">
				<h3 class="text-primary"><%= article.get("title") %></h3>
				<p><%= article.get("body") %></p>
			</div>
		<div id="disqus_thread"></div>

	</script>


	<script type="text/javascript">


		/********************************************************/
		/* Models 												*/
		/********************************************************/
		var Article = Backbone.Model.extend({
			//urlRoot: '/rest/articles',
			urlRoot: function() {
				return '/rest/api/articles/';
			},
			defaults: {
				title: "Not specified",
				body: "Not specified"
			}
		});

		var Articles = Backbone.Collection.extend({
			model: Article,
			url: '/rest/api/articles/'
		});


		/********************************************************/
		/* Views 												*/
		/********************************************************/

		SummaryView = Backbone.View.extend({
			render: function(){
				var that = this;
				var siteSummary = new Articles();
				siteSummary.fetch({
					success: function() {
						var template = _.template( $("#summary_template").html(), { siteSummary: siteSummary.models } );
						that.$el.html( template );
					}
				})

			}
		});

		DetailView = Backbone.View.extend({
			render: function(options) {
				var that = this;
				var thisArticle = new Article({id: options.id});
				thisArticle.fetch({
					success: function(article) {
						var template = _.template ($("#detail_template").html(), {article: article});
						that.$el.html( template );
						disqus_view.render({identifier: article.id});
					}

				});
			}
		});

		var disqus_shortname = 'clarkie-io'; // required: replace example with your forum shortname
		var disqus_url = 'http://clarkie.io';
		var DisqusView = Backbone.View.extend({
			el: '#disqus_thread',

			initialize: function() {
				// DISQUS universal code:

				var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
				dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
				(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);

			},

			render: function(options) {
				DISQUS.reset({
					//options: options,
					reload: true,
					config: function(){
						this.page.identifer = 'clarkie-' + options.identifer;
						this.page.url = 'http://clarkie.io/#!/article/' + options.identifier;
					}
				});
			}
		});

		var summary_view = new SummaryView({ el: $(".page") });
		var detail_view = new DetailView({ el: $(".page")});
		var disqus_view = new DisqusView();

		/********************************************************/
		/* Router 												*/
		/********************************************************/
		var Router = Backbone.Router.extend({
				routes: {
					"": "home",
					"!/article/:id": "fullArticle",
				}
		});

		var router = new Router;
		router.on('route:home', function() {
		 	summary_view.render();
		});
		router.on('route:fullArticle', function(id) {
			detail_view.render({id: id});
		});
		Backbone.history.start();
	</script>

	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-47073255-1', 'clarkie.io');
	  ga('send', 'pageview');
	</script>
</body>
</html>