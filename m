From: fthain@telegraphics.com.au
Subject: Re: [PATCH 1/2] pmac-zilog: add platform driver
Date: Sat, 9 Jan 2010 14:14:28 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1001091331560.17571@nippy.intranet>
References: <alpine.OSX.2.00.0911171657290.371@silk.local>  <10f740e81001020443h78c615d2l206b99c386600108@mail.gmail.com>  <alpine.OSX.2.00.1001030255060.414@localhost> <10f740e81001081117s54c5dd9by4cc0490e0c57d67b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:60526 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751490Ab0AIDW0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jan 2010 22:22:26 -0500
In-Reply-To: <10f740e81001081117s54c5dd9by4cc0490e0c57d67b@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org



On Fri, 8 Jan 2010, Geert Uytterhoeven wrote:

> On Sat, Jan 2, 2010 at 17:39, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> > On Sat, 2 Jan 2010, Geert Uytterhoeven wrote:
> >> On Tue, Nov 17, 2009 at 10:04, Finn Thain 
> >> <fthain@telegraphics.com.au> wrote: BTW, there are a few other minor 
> >> checkpatch issues with some of the other patches in the series, too.
> >
> > I ran checkpatch on all those patches before I submitted them. I 
> > ignored some of the complaints about whitespace where I felt that 
> > checkpatch got it wrong (space character following tab character, 
> > IIRC).
> >
> > checkpatch found lots of mistakes that I did fix, but it can't 
> > determine the most human readable style in all cases, especially where 
> > consistency with the surrounding code is actually more conducive to 
> > readability than strict but sporadic conformance to simple rules would 
> > be.
> 
> It seems your editor adds spaces to lines that are continuations of the 
> previous statement.

I put in spaces after tabs for hard wrapped lines so that code always 
renders properly regardless of the tab settings that might to be applied 
by any editor, browser, word processor, mailer, tty discipline, publisher, 
etc. that might stand between the human reader and the code.

Documentation/CodingStyle says that those indented lines should be 
"substantially to the right", but checkpatch doesn't conform and nor does 
most kernel code. Some code does follow my preference, which is more 
readable, and also happens to follow the example of the lisp code found in 
the same style guide.

But if you prefer no spaces after tabs, I can do that instead. I'm not 
fussed.

> I fixes them up and applied all your patches to linux-m68k.git.

Thanks. I'll resend the patch to address your comments earlier in the 
thread.

Finn

> The other warnings were indeed false positives or complains about
> keeping consistency
> with the surrounding code.
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
