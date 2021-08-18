patterns = [
  "/initialize",
  "/api/chair/?$",
  "/api/chair/[0-9]+",
  "/api/chair/low_priced",
  "/api/chair/search",
  "/api/chair/search/condition",
  "/api/chair/buy/[0-9]+",
  "/api/estate/?$",
  "/api/estate/[0-9]+",
  "/api/estate/low_priced",
  "/api/estate/search?$",
  "/api/estate/search/condition",
  "/api/estate/req_doc/[0-9]+",
  "/api/estate/nazotte",
  "/api/recommended_estate/[0-9]+",
  "/images/.+",
  "/_next/static/.+",
  "^/[^ai_]", # その他どうでもいいやつ
]

cmd = "cat logs/access.log | alp ltsv -m \"#{patterns.join(',')}\""
puts(cmd)
system(cmd)

