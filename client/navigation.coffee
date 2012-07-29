Template.navigation.isActive = (pageName) ->
    isActive = Session.equals 'currentPage', pageName
    'active' if isActive

Template.navigation.pages = ->
    [
        {
            url: '/letsOrganize!'
            title: "Let's Organize!"
            is_active: Template.navigation.isActive("letsOrganize!")
        }
        {
            url: '/help'
            title: 'Help!'
            is_active: Template.navigation.isActive("help")
        }
    ]

Template.navigation.events =
    'click a': (e) ->
        e.preventDefault()
        $this = $(e.target)
        url = $this.attr 'href'
        Router.navigate url, true
