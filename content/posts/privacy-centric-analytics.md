+++
title = "Privacy Centric Analytics"
date = "2025-02-12T16:35:44-05:00"
#dateFormat = "2006-01-02" # This value can be configured for per-post date formatting
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["nix", "selfhosting"]
description = ""
showFullContent = false
draft = true
+++

A thing I was interested in was how I could do some tracking about who is
visiting this site without hooking into the ugly beast that is Google Analytics.
This led me to find (umami)[https://github.com/umami-software/umami], which
claims to be "a simple, fast, privacy-focused alternative to Google Analytics".
Looking further at their documentation we can see that it's GDPR compliant
(doesn't collect any PII) and is cookieless, meaning we don't need an annoying
banner popup. Seems pretty sweet!

Looking over the docs it looks like we need a database, our options are mysql,
mariadb and postgres. My personal preference is mariadb so lets stand one up
real quick.

```nix
services.mysql = {
  enable = true;
  initialDatabases = ["umami"];
  ensureUsers = [
    {
      name = "umami";
      ensurePermissions = {
        "umami.*" = "ALL PRIVILEGES";
      };
    }
  ];
};
```
