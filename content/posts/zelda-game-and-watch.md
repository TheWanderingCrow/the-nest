+++
title = "Hacking the Zelda Game and Watch Console"
date = "2025-02-24T13:08:14-05:00"
#dateFormat = "2006-01-02" # This value can be configured for per-post date formatting
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = ""
showFullContent = false
readingTime = false
hideComments = false
draft = true
+++

I got one of those little game and watch consoles as a christmas gift a while
ago. Recently I decided to open it up to see what was in there and as I expected
it was pretty simple.

// disassembly notes here

// spi pinout located here
https://www.mxic.com.tw/Lists/Datasheet/Attachments/8909/MX25U3232F,%201.8V,%2032Mb,%20v1.2.pdf

`flashrom -p ft2232_spi:type=2232H,port=B,divisor=4 -c "MX25U3235E/F" -r dump.bin`

13a5565831dfb49f16700cf07dad88f6 dump.bin 13a5565831dfb49f16700cf07dad88f6
dump2.bin
