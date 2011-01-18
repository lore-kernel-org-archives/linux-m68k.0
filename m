From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Wed, 19 Jan 2011 12:54:21 +1300
Message-ID: <AANLkTi=hMc5uKbWRHQkyPe30my1NzYpa7p-OB5_24=Xw@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
	<AANLkTimnXi0g_F4TT7gv3JnebwBcJe2oH7NNo83JN2XZ@mail.gmail.com>
	<AANLkTi=O2C5keqTm3Q4w8_T1Z=Dd68CAPSe-FaWt_h_x@mail.gmail.com>
	<AANLkTinqCexLUjNxgSmkphx-oMVgz27b2GH1n2NVNU2n@mail.gmail.com>
	<AANLkTimWyj2HriMd3mpPgc1Mu9RWb8fyPiKrVWfs=4+t@mail.gmail.com>
	<AANLkTim32Xs+ajq1fWiDae9dZ-n0HD-5bJYOr31gwabP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:53518 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533Ab1ARXyX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Jan 2011 18:54:23 -0500
Received: by wwa36 with SMTP id 36so236253wwa.1
        for <linux-m68k@vger.kernel.org>; Tue, 18 Jan 2011 15:54:22 -0800 (PST)
In-Reply-To: <AANLkTim32Xs+ajq1fWiDae9dZ-n0HD-5bJYOr31gwabP@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,

>> I thought the 'discard' marks the start of no longer used options
>> (i.e. option processing stops at discard). My bad.
>
> You got me, I never looked at it that way ;-)
>
> No, it comes from commit 681142f9211b23e6aa2984259d38b76d7bdc05a8
> ("fat: make discard a mount option")

Now I'll have to go and look what that is about :-)

>> Given that I could not even remember what it was that I had to do to
>> the FAT code to get it to what it does now, we best leave it at that.
>> Schroedingers cat, and all that :-)
>
> commit cc9c5fc236c0d02cae44c2fbcc8ffa3ae5e517b6 ("Atari FAT updates")
> more or less summarizes it. It's the logic which decides whether the FAT is
> 16-bit or 12-bit.

Yep, I had seen it in the log message there when I had a look at what
still was on m68k-queue. Just couldn't remember any of that without
refreshing my memory.

I'm still being bitten by the limit on logical sector size for FAT -
partitions larger than 128M either can be read from Linux (sector size
4k) or TOS (sector size 8k) but not both. Has anyone found a
workaround for this?

In other news, SCSI on the Falcon is still broken - timeouts for SCSI
commands are started by the block layer, but commands cannot be
guaranteed to get queued in the lowlevel driver unless the lowlevel
driver has access to the SCSI DMA right away. Upon timeout, the
request isn't actually found on the lowlevel queue in case the queue
request had to wait. I'm unsure what the correct strategy is here:
defer queueing requests by pretending the driver is busy, or queue
requests and try to kick off the coroutine as soon as DMA gets
available?

Cheers,

  Michael
