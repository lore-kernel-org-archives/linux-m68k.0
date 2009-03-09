From: Geoff Levand <geoffrey.levand@am.sony.com>
Subject: Re: [rtc-linux] Re: [PATCH 7/7] powerpc/ps3: Add rtc-ps3
Date: Mon, 9 Mar 2009 12:06:56 -0700
Message-ID: <49B568D0.5000901@am.sony.com>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-6-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-7-git-send-email-Geert.Uytterhoeven@sonycom.com>	<1236605183-22718-8-git-send-email-Geert.Uytterhoeven@sonycom.com>	<20090309151216.17f13862@i1501.lan.towertech.it>	<49B55A21.2010801@am.sony.com> <20090309194307.154f3e95@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:34919 "EHLO
	TX2EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619AbZCITHI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Mar 2009 15:07:08 -0400
In-Reply-To: <20090309194307.154f3e95@i1501.lan.towertech.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>, Joe Perches <joe@perches.com>
Cc: rtc-linux@googlegroups.com, Geert.Uytterhoeven@sonycom.com, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>

Hi,

On 03/09/2009 11:43 AM, Alessandro Zummo wrote:
> Geoff Levand <geoffrey.levand@am.sony.com> wrote:
>> On 03/09/2009 07:12 AM, Alessandro Zummo wrote:
>> > On Mon,  9 Mar 2009 14:26:23 +0100
>> > Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
>> >> +
>> >> +MODULE_AUTHOR("Sony Corporation");
>> > 
>> >  real name, if possible and a contact address
>> >  here . Just in case I need someone to bother :)
>> 
>> Please look at the MAINTAINERS file, that will give
>> the contact for PS3.  It is much easier to maintain
>> a single place for the contact than many spread
>> throughout the kernel sources.
> 
>  Having it in MODULE_AUTHOR allow my scripts to automatically
>  send an email when appropriate.
> 
>  MAINTAINERS lists the files with an arbitrary
>  driver title so that the search must be made by an human and there's
>  no field that links a person to a specific .c .
> 
>  so every time I want to address someone I need to check MODULE_AUTHOR,
>  the git log and the MAINTAINERS file.

I see.  It seems what you want is MODULE_MAINTAINER, as author is
the author, who after some time, may not be the maintainer any more.

There was some work by Joe Perches to list the files a maintainer is
responsible for into the MAINTAINERS file.  I think that would give
you what you want, a way to automatically get the maintainer of a
file.

Joe, could you let us know the status of that work?

-Geoff

