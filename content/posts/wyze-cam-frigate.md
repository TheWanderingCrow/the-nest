+++
title = "Wyze Cam Frigate"
date = "2025-02-22T09:09:44-05:00"
#dateFormat = "2006-01-02" # This value can be configured for per-post date formatting
author = "Crow"
cover = ""
tags = ["hardware reverse engineering"]
description = ""
showFullContent = false
readingTime = false
hideComments = false
draft = true
+++

I really like Wyze cams. They're cheap, decent quality. What I don't like about
them is I have to connect them to a 3rd party account and all my footage gets
streamed into their cloud. The problem is, there aren't very many IP cameras
that meet the quality and price point of Wyze cameras.

// put what model we have here // disassembly here They're rather easy to
disassemble, the faceplate comes off and you'll need tweezers to remove the 3
white rubber inserts to access the screws.

will need to pop the faceplate out, there is a red rubber gasket. It does take
some force to remove. // insert picture of removed thing

To remove the faceplate you will need to remove the four philips screws from the
pack board. Although we can technically access the SPI without further
disassembly.
