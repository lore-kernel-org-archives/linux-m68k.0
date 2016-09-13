From: Stephen N Chivers <schivers@csc.com>
Subject: Re: mvme147 status
Date: Wed, 14 Sep 2016 07:05:27 +1100
Message-ID: <OF8E989A33.2EDB4279-ONCA25802D.006D188C-CA25802D.006E5D75@csc.com>
References: <20160911171618.GA13380@infradead.org> <CACz-3rgtA0pvSZV38ezRWAxDsgcEa_+_teQ3-1dvY4Cf22hfyQ@mail.gmail.com> <CAMuHMdUFxc_OBR8L84gbgNW8u0aArQNxMGf5P4mPSj56xQXeNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail55.messagelabs.com ([216.82.242.33]:50142 "EHLO
        mail55.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760202AbcIMUFe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Sep 2016 16:05:34 -0400
In-Reply-To: <CAMuHMdUFxc_OBR8L84gbgNW8u0aArQNxMGf5P4mPSj56xQXeNQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@vger.kernel.org>, linux-m68k-owner@vger.kernel.org, Kars de Jong <nacirrut@gmail.com>

linux-m68k-owner@vger.kernel.org wrote on 09/12/2016 05:43:48 PM:

> From: Geert Uytterhoeven <geert@linux-m68k.org>
> To: Kars de Jong <nacirrut@gmail.com>
> Cc: Christoph Hellwig <hch@infradead.org>, "linux-m68k@lists.linux-
> m68k.org" <linux-m68k@vger.kernel.org>, Stephen N Chivers/AUS/CSC@CSC
> Date: 09/12/2016 05:43 PM
> Subject: Re: mvme147 status
> Sent by: linux-m68k-owner@vger.kernel.org
> 
> Hi Kars, Christoph,
> 
> On Sun, Sep 11, 2016 at 7:49 PM, Kars de Jong <nacirrut@gmail.com> 
wrote:
> > Op zondag 11 september 2016 heeft Christoph Hellwig 
<hch@infradead.org> het
> > volgende geschreven:
> >> do you know what the status of the mvme147 board support / SCSI 
driver
> >> is?  The mvme147 scsi driver is one of the few remaining drivers 
still
> >> using the scsi_module infrastructure thay I'd like to finally kill 
off.
> >>
> >> Unlike some other drivers it should be fairly trivial to convert, but
> >> I'd like to first know if there is any point in investing that work.
> >
> > I still have some MVME147 hardware, but I haven't run anything more 
recent
> > than 2.6 kernels on it. I doubt anyone is still using it.
> >
> > Are there still other users of the chipset driver?  Does 
CONFIG_MVME147
> 
> The wd33c93 chipset driver is also used on various Amigas and on SGI 
MIPS
> systems. Those no longer use scsi_module, though (IIRC I converted most 
of
> them in 2009).
> 
> > still build?
> 
> Of course it does ;-)
> 
> > I personally don't have a big issue with just killing the board 
support
> > code, it can always be revived when needed.
> 
> Killing board support doesn't gain us that much...
> 
> Stephen, are you still using them?

Yes, I am still using the Motorola MVME-167 boards.

They are operated without disks (boot from a NFS file server). They 
currently
run kernel 2.6.24 as a baseline.

Support for the serial console (serial167) on the MVME-167 board was 
dropped in
linux 2.6.37.

I have experimented with later kernel versions (up to and including 3.17) 
and have a revised device
driver for the serial console (now called mvme167x_scc) as the original 
one was
dropped around 2.6.37 kernel. The new console driver works without 
problems
but I have never submitted the patches. Geert has seen a version of them 
but
I haven't had the time to continue the work as my day job has been very 
intense
for about two years.

I do not have any SCSI disks for them, although I might be able to cobble
something together using some old SUN-4 disks we have here. The big 
problem
is the SCSI cable from the "transition" module at the back of the VME rack
to SCSI enclosure.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. 
But
> when I'm talking to journalists I just say "programmer" or somethinglike 
that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
