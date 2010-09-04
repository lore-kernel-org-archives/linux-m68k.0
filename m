From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Fwd: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
 addresses in the arch directory.
Date: Sat, 4 Sep 2010 14:59:28 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1009041451580.341@localhost>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-6-git-send-email-justinmattock@gmail.com> <AANLkTikTeznNoS0CMEpMe+mJKgrjpsGf-z798vA0chbB@mail.gmail.com> <4C80AE79.2040805@gmail.com> <alpine.OSX.2.00.1009031823590.344@localhost>
 <AANLkTik3+3dWP-=4mnOrPDSBCKoyy=1Rs8Hq-htDC-Lw@mail.gmail.com> <alpine.OSX.2.00.1009032033570.344@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:40879 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838Ab0IDE7e (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 4 Sep 2010 00:59:34 -0400
In-Reply-To: <alpine.OSX.2.00.1009032033570.344@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Justin P. Mattock" <justinmattock@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>


>From an email I recieved privately, from someone who knows DNS better than 
I do (hi, Niels), I've learnt that what I wrote is not accurate. The CNAME 
is actually sufficient, as long as vger continues to treat
<linux-m68k@lists.linux-m68k.org>
as an alias for 
<linux-m68k@vger.kernel.org>

Finn

On Fri, 3 Sep 2010, I wrote:

> 
> On Fri, 3 Sep 2010, Geert Uytterhoeven wrote:
> 
> > On Fri, Sep 3, 2010 at 10:32, Finn Thain <fthain@telegraphics.com.au> 
> > wrote:
> > >
> > > Indeed, the MAINTAINERS file says that the list for arch/m68k/mac/ is 
> > > linux-m68k@lists.linux-m68k.org. Is this alias still working? Perhaps 
> > > it should be changed to linux-m68k@vger.kernel.org?
> > 
> > The alias should work:
> > 
> > lists.linux-m68k.org.  86400 IN CNAME vger.kernel.org.
> 
> It works not because of the CNAME record, but because of the MX record:
> 
> $ dig +short mx lists.linux-m68k.org
> vger.kernel.org.
> 10 vger.kernel.org.
> 999 bl-ckh-le.kernel.org.
> $ dig +short mx vger.kernel.org
> 10 vger.kernel.org.
> 999 bl-ckh-le.kernel.org.
> 
> The CNAME means that http://lists.linux-m68k.org/ takes you to vger, and 
> this only works because the apache vhost on vger is willing to answer to 
> "lists.linux-m68k.org" as well as "vger.kernel.org"...
> 
> Finn
> 
