acl {
  enabled = true
  default_policy = "deny"
  down_policy = "extend-cache"
  enable_token_persistence = true
  tokens {
      master = "32fb9912-a7a8-91f3-915b-d122538d4991"
      agent = "32fb9912-a7a8-91f3-915b-d122538d4992"
      replication = "32fb9912-a7a8-91f3-915b-d122538d4993"
    }
}