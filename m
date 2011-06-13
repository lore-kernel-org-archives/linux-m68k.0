From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable
Date: Tue, 14 Jun 2011 08:35:47 +1200
Message-ID: <BANLkTikepyD1GjzOpYm6uuHj88TpVkowZA@mail.gmail.com>
References: <E1QNV5z-0006jD-Ej@franck.debian.org>
	<20110521122605.GA16345@chumley.earth.sol>
	<Pine.BSM.4.64L.1105211232060.14234@herc.mirbsd.org>
	<Pine.BSM.4.64L.1105211327140.14234@herc.mirbsd.org>
	<BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
	<BANLkTikQSZev=QHYFR2kxsUY2xND37Dr8g@mail.gmail.com>
	<BANLkTinJJn0wvZrdQKgL-1GvVt7mT7DNyQ@mail.gmail.com>
	<BANLkTinhBpxEqRb_Xi-HCejqLPSG3wJGsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:54003 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751686Ab1FMUfr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jun 2011 16:35:47 -0400
Received: by pwi15 with SMTP id 15so2286397pwi.19
        for <linux-m68k@vger.kernel.org>; Mon, 13 Jun 2011 13:35:47 -0700 (PDT)
In-Reply-To: <BANLkTinhBpxEqRb_Xi-HCejqLPSG3wJGsw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Thorsten Glaser <tg@mirbsd.de>

Hi Geert,

On Tue, Jun 14, 2011 at 6:49 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, May 30, 2011 at 19:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, May 30, 2011 at 19:14, Michael Schmitz
>> <schmitzmic@googlemail.com> wrote:
>>> remind me - what rewrite will be required?
>>
>> Remove your own memory allocator.
>> Probably the simplest is to always reserve some ST-RAM on bootup, and let
>> stram_alloc()/stram_free() use that reserved pool.
>>
>>> I've seen your work on the chip RAM driver, will take a close look at
>>> adapting this for ST-RAM when I return from overseas.
>>
>> When will you return, just in case I come to it before that (woow, I
>> feel overly optimistic now)?
>
> Has anyone besides me tried http://lkml.org/lkml/2011/6/5/46 on top of
> https://lkml.org/lkml/2011/5/21/142?

Sorry, I haven't had much time to do any coherent work on this yet. I
seem to have fried my EtherNAT PHY, two of my SCSI disks didn't come
back up after I returned from overseas, and I have been just too
jetlagged to risk blowing up anything else.

I do very much appreciate your effort in getting rid of the old ST-RAM
allocator, and I will try to test a new kernel later this week.

Cheers,

  Michael
