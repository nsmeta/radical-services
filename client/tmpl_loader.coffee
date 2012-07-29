Template.tmpl_loader.currentPags_is = (pageName) ->
    currentPage = Session.get 'currentPage' ? 'letsOrganize!'
    currentPage == pageName
