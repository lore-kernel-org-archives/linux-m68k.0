From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 04/14] nubus: Fix log spam
Date: Sun, 12 Nov 2017 10:47:35 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711121022470.3@nippy.intranet>
References: <cover.1510377368.git.fthain@telegraphics.com.au>  <0c2f94698a76d320786aac770d2db006fd4e5764.1510377368.git.fthain@telegraphics.com.au> <1510412649.10883.12.camel@perches.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54148 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752204AbdKKXrS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Nov 2017 18:47:18 -0500
In-Reply-To: <1510412649.10883.12.camel@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 11 Nov 2017, Joe Perches wrote:

> On Sat, 2017-11-11 at 01:12 -0500, Finn Thain wrote:
> > Testing shows that a single Radius PrecisionColor 24X display board,
> > which has 95 functional resources, produces over a thousand lines of
> > log messages. Suppress these messages with pr_debug().
> > Remove some redundant messages relating to nubus_get_subdir() calls.
> > Fix the format block debug messages which has the sequence of entries
> > backwards (my bad).
> > Move the "Scanning slots" message to its proper location.
> 
> pr_debug calls are compiled completely away to nothing
> unless DEBUG is
> defined or CONFIG_DYNAMIC_DEBUG is
> enabled.
> 
> Aren't some of these actually useful?
> 

No, not AFAIK. Was there anything in particular that you wanted to see in 
the log?

> Perhaps it'd be nicer to have some nubus
> specific flag to enable these outputs instead
> of relying on either #define DEBUG or
> CONFIG_DYNAMIC_DEBUG?
> 

The file /proc/nubus has the important info. These patches don't affect 
that. For example,

# cat /proc/nubus
Nubus devices found:
Slot E: Farallon EtherMac LC-TP
# 

I think that the driver probe log messages have the other facts that are 
of interest. (Please refer to the network driver patch series I sent.) For 
example,

mac8390 slot.E: Memory length resource not found, probing
mac8390 slot.E: Farallon EtherMac LC-TP (type farallon)
mac8390 slot.E: MAC 00:00:c5:43:36:11, IRQ 61, 32 KB shared memory at 0xfeed0000, 32-bit access.

Thanks for your review.

-- 
