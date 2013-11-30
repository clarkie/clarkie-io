component restpath="/articles" rest="true"{

	 variables.tempData = [{"id": 1, "title": "Technical Debt", "body": "How do you prevent your code from falling off the cliff?" }
			,{"id": 2, "title": "I love graphs!", "body": "Graphite and statsd intro at ConcretePlatform" }
			,{"id": 3, "title": "Delete code", "body": "Fisheye and deleteing code. 16 million lines of code to 750k" }
			,{"id": 4, "title": "Database Analysis", "body": "Looking at optimisation techniques from an outsiders point of view xdxdxfxfdxffdxfdx" }]

	/* variables.tempData = {
		"2" : {"id": 2, "title": "I love graphs!", "body": "Graphite and statsd intro at ConcretePlatform" },
		"3" : {"id": 3, "title": "Delete code", "body": "Fisheye and deleteing code. 16 million lines of code to 750k" },
		"4" : {"id": 4, "title": "Database Analysis", "body": "Looking at optimisation techniques from an outsiders point of view xdxdxfxfdxffdxfdx" }
	} */

	remote any function getArticleSummary() httpmethod="GET" {
		return variables.tempData
	}

	remote any function helloURL(string a restargsource="Path") httpmethod="GET" restpath="{a}" {
		return variables.tempData[arguments['a']]
	}
}