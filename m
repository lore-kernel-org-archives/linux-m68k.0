From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 04/14] nubus: Fix log spam
Date: Sat, 11 Nov 2017 16:08:33 -0800
Message-ID: <1510445313.10883.46.camel@perches.com>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
         <0c2f94698a76d320786aac770d2db006fd4e5764.1510377368.git.fthain@telegraphics.com.au>
         <1510412649.10883.12.camel@perches.com>
         <alpine.LNX.2.00.1711121022470.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtprelay0030.hostedemail.com ([216.40.44.30]:58750 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752275AbdKLAIi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 11 Nov 2017 19:08:38 -0500
In-Reply-To: <alpine.LNX.2.00.1711121022470.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2017-11-12 at 10:47 +1100, Finn Thain wrote:
> On Sat, 11 Nov 2017, Joe Perches wrote:
> 
> > On Sat, 2017-11-11 at 01:12 -0500, Finn Thain wrote:
> > > Testing shows that a single Radius PrecisionColor 24X display board,
> > > which has 95 functional resources, produces over a thousand lines of
> > > log messages. Suppress these messages with pr_debug().
> > > Remove some redundant messages relating to nubus_get_subdir() calls.
> > > Fix the format block debug messages which has the sequence of entries
> > > backwards (my bad).
> > > Move the "Scanning slots" message to its proper location.
> > 
> > pr_debug calls are compiled completely away to nothing
> > unless DEBUG is
> > defined or CONFIG_DYNAMIC_DEBUG is
> > enabled.
> > 
> > Aren't some of these actually useful?
> > 
> 
> No, not AFAIK. Was there anything in particular that you wanted to see in 
> the log?

I don't have any of these and I only glanced at
the code, so if it's unimportant, then that's fine.

The only one I saw as remotely useful was the MAC
address.

> > Perhaps it'd be nicer to have some nubus
> > specific flag to enable these outputs instead
> > of relying on either #define DEBUG or
> > CONFIG_DYNAMIC_DEBUG?
> > 
> 
> The file /proc/nubus has the important info. These patches don't affect 
> that. For example,
> 
> # cat /proc/nubus
> Nubus devices found:
> Slot E: Farallon EtherMac LC-TP
> # 

Anyway maybe use nubus_debug and allow that to be
something like:

#ifdef CONFIG_NUBUS_DEBUG
#define DEBUG
#endif

#define nubus_debug pr_debug

or

and maybe allow some module param to control it

MODULE_PARM_DESC(nubus_init_loggging, "Enable nubus init debug logging - set to 1 to enable");

#define nubus_debug(fmt, ...)					\
do {								\
	if (nubus_init_logging)					\
		printk(KERN_DEBUG fmt, ##__VA_ARGS__);		\
} while (0)

Just suggestions.  Use or ignore.

cheers, Joe
