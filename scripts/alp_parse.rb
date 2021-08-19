patterns = [
  "/bump",
  "/buy",
  "/buy/compelete",
  "/categories/[0-9]+/items",
  "/complete",
  "/initialize",
  "/items/[0-9]+",
  "/items/[0-9]+.json",
  "/items/[0-9]+/buy",
  "/items/[0-9]+/edit",
  "/items/edit",
  "/login",
  "/login",
  "/new_items.json",
  "/new_items/[0-9]+.json",
  "/register",
  "/register",
  "/reports.json",
  "/sell",
  "/sell",
  "/settings",
  "/ship",
  "/ship_done",
  "/timeline",
  "/transactions/[0-9]+.png",
  "/transactions/[0-9]+",
  "/users/[0-9]+",
  "/users/[0-9]+.json",
  "/users/setting",
  "/users/transactions.json",
  "/upload/",
]

cmd = "cat logs/access.log | alp ltsv -m \"#{patterns.join(',')}\""
puts(cmd)
system(cmd)

