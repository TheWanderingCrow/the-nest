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

There's a docker compose in here that we can translate to nix. TODO: Post
translation

Now we need some sort of app secret, I manage all my deployment secrets in SOPS
which probably deserves its own post entirely, just know we can generate one
pretty easily with `head -c 32 /dev/urandom | base64`. With that secret
generated we can make a template and then define the container umami will run on

TODO: Get a screenshot or smth for umami running and show how to add the umami
tracking thingy to the base hugo templates
