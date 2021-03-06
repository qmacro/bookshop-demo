module.exports = (srv) => {

  srv.on('getNumberOfBooksForDynamicTile', req => {
    console.log("getNumberOfBooksForDynamicTile: " + JSON.stringify(req.data))
    return {
      icon : "sap-icon://travel-expense",
      info : "Quarter Ends!",
      infoState : "Critical",
      number : "43.33",
      numberDigits : 1,
      numberFactor : "k",
      numberState : "Positive",
      numberUnit : "EUR",
      stateArrow : "Up",
      subtitle : "Quarterly overview",
      title : "Travel Expenses"
    }
  })

  // Sample based on 
  // https://blogs.sap.com/2019/04/15/annotated-links-episode-15-of-hands-on-sap-dev-with-qmacro/
  srv.on('hello', req => {
    console.log("hello: " + JSON.stringify(req.data))
    return "Hello " + req.data.to
  })

}
