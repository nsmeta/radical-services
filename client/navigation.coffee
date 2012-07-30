Template.navigation.isActive = (pageName) ->
    isActive = Session.equals 'currentPage', pageName
    'active' if isActive

Template.navigation.pages = ->
    [
        {
            url: '/organize!'
            title: "Organize!"
            is_active: Template.navigation.isActive("organize!")
        }
        {
            url: '/services'
            title: 'Services'
            is_active: Template.navigation.isActive("services")
        }
        {
            url: '/groups'
            title: 'Groups'
            is_active: Template.navigation.isActive("groups")
        }
    ]

Template.navigation.events =
    'click a': (e) ->
        e.preventDefault()
        $this = $(e.target)
        url = $this.attr 'href'
        Router.navigate url, true
