Workspace = Backbone.Router.extend
    routes:
        '*page': 'setCurrentPage'
    setCurrentPage: (page) ->
        allowedPages = ['letsOrganize!', 'help']
        pageIsAllowed = page in allowedPages
        page = allowedPages[0] unless pageIsAllowed
        Router.navigate page, trigger: no, replace: true
        Session.set 'currentPage', page

Router = new Workspace
Meteor.startup ->
    Backbone.history.start pushState: true
