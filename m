From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Fwd: [PATCH 35/91] arch/m68k/q40/README Update broken web
 addresses in the arch directory.
Date: Fri, 3 Sep 2010 19:13:08 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1009031906200.344@localhost>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-5-git-send-email-justinmattock@gmail.com> <AANLkTimyRsVmeeM-mNwAm8uwhAEYZx4Wx56=ARy=tttO@mail.gmail.com> <alpine.OSX.2.00.1009031821450.344@localhost> <4C80B350.6050006@gmail.com>
 <alpine.OSX.2.00.1009031837380.344@localhost> <4C80BA15.1000203@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:55639 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753496Ab0ICJNJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 05:13:09 -0400
In-Reply-To: <4C80BA15.1000203@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Justin P. Mattock" <justinmattock@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 3 Sep 2010, Justin P. Mattock wrote:

> On 09/03/2010 01:47 AM, Finn Thain wrote:
> > 
> > On Fri, 3 Sep 2010, Justin P. Mattock wrote:
> > 
> > > On 09/03/2010 01:23 AM, Finn Thain wrote:
> > > > 
> > > > URLs can't be split across lines usefully, so disregard the 
> > > > checkpatch complaint.
> > > > 
> > > > Finn
> > > > 
> > > 
> > > with the coding style, what files should ignore coding style with 
> > > the tab rule i.e. Kconfig *.c, *.h, README, etc... (from here 
> > > Kconfig make sense due to the ncurses interface..)
> > 
> > I'm not sure what you mean (?)
> > 
> > Kconfig seems to use the<...> syntax for URLs. checkpatch doesn't 
> > complain about the ~90 character long URL in ./drivers/scsi/Kconfig...
> > 
> > Finn
> > 
> 
> yeah this is a bit confusing, especially with checkpatch in the mix.. So 
> if I understand correctly, using checkpatch, any address that uses the 
> column limit: (example)
> + http://web.archive.org/web/*/http://www.unix-ag.org/Linux-Alpha/
> + Architectures/Avanti.html.
> 
> breaks checkpatch(without the <.....>) in any of the files? as for 
> Kconfig make the url long so the she looks pretty for the user..

I don't know whether checkpatch special-cases Kconfig or angle brackets. 
You'd have to put it to the test. But it is not important.

The point is, you can't line-wrap URLs without breaking software that 
looks for them (text editors, browsers, terminal emulators ... your own 
scripts too probably).

Finn
