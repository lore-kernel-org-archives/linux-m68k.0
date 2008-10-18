From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sat, 18 Oct 2008 19:39:48 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:32803 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750926AbYJRRjv (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 18 Oct 2008 13:39:51 -0400
In-Reply-To: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Brad Boyer <flar@allandria.com>, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, 18 Oct 2008, Riccardo wrote:

> I don't know "how", but with 2.2 kernels I always had a correct date at
> boot without any tricks. It is true though that with high CPU load we
> had clockskew and that we didn't save back the date and hourtime to the
> clock, thus any clock setting needed to be done from the mac side. A
> compromoise, but better than the current situation.

The clockproblem is something I stumble upon every now and then on
various machinees - I really wish there was a kernel parameter where one
could set a date string, then the bootloader could pass it on.

Currently i use a /.timestamp file that I read from init=/sbin/init.noclock;

---
firda ~ # cat  /sbin/init.noclock
#! /bin/bash
if test $(/bin/date +%Y) -lt 2008 ; then
        /bin/date -s "1970-01-01 + $(($(/bin/stat -c %X /.timestamp) +3600)) seconds"
fi
exec /sbin/init
---

I make sure the .timestamp is touched regularly and on shutdown.


This trick I now use on quadra910, an old acer laptop, gumstix ... :P

-- kolla
