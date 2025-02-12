+++
title = "This Site"
date = "2025-02-12T10:24:31-05:00"
#dateFormat = "2006-01-02" # This value can be configured for per-post date formatting
author = "Crow"
tags = ["nix", "selfhosting"]
description = ""
showFullContent = false
readingTime = false
hideComments = false
+++

The Nest uses [hugo](https://gohugo.io), a static site generator to build the
pages. These are deployed to an S3 bucket hosted on cloudflare (yay no egress
costs) and I can build updates using the nix flake at the project root.

For those interested, nix is a functional language used primarily in
[NixOS](https://nixos.org) for managing system configurations declaratively, but
it's useful for many things like packaging software.
