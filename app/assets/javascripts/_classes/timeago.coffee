@Moe ?= {}
$ = jQuery

class @Moe.Timeago
  constructor: ->
    $ @initialize


  initialize: =>
    @run()
    @observe()


  run: (nodes = document.body) =>
    $(nodes)
      .find(".js-timeago")
      .addBack(".js-timeago")
      .timeago()
      .each (_i, el) ->
        el.title = new Date(el.dateTime).toString()


  observe: =>
    @observer = new MutationObserver @onMutate

    config =
      childList: true
      subtree: true

    @observer.observe document, config


  onMutate: (mutations) =>
    for mutation in mutations
      @run mutation.addedNodes
