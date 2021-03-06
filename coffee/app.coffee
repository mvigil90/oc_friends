###
# ownCloud
#
# @author Sarah Jones
# Copyright (c) 2013 - Sarah Jones <sarahe.e.p.jones@gmail.com>
#
# This file is licensed under the Affero General Public License version 3 or later.
# See the COPYING-README file
#
###

angular.module('Friends', ['OC']).config ['$provide', '$interpolateProvider', 
($provide, $interpolateProvider) ->

	# uses doulbe square brackets instead of double curly braces because twig
	# already uses doulbe curly braces
	$interpolateProvider.startSymbol('[[');
	$interpolateProvider.endSymbol(']]');

	# Use this for configuration values
	Config =
		myParam: 'test'

	# declare your routes here
	# Hint: angularjs comes with an own route system with which you can
	# build HTML5 apps with enabled history access, meaning: you can go
	# forward and backward and change the state of your app
	# http:#docs.angularjs.org/api/ng.$route
	Config.routes =
		createFriendshipRequestRoute: 'friends_ajax_createFriendshipRequest'
		acceptFriendshipRequestRoute: 'friends_ajax_acceptFriendshipRequest'
		getFriendshipRequestsRoute: 'friends_ajax_getFriendshipRequests'
		getFriendshipsRoute: 'friends_ajax_getFriendships'
		removeFriendshipRoute: 'friends_ajax_removeFriendship'

	return $provide.value('Config', Config)
]


# This function is run once angular is set up. That doesnt mean though that
# the document is ready
angular.module('Friends').run ['$rootScope', ($rootScope) ->

	init = ->
		$rootScope.$broadcast('routesLoaded')

	# this registers a callback that is executed once the routes have
	# finished loading. Before this you cant really do request
	OC.Router.registerLoadedCallback(init)
]
