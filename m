From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream and debian-kernel
Date: Fri, 29 Mar 2013 09:30:36 +0100
Message-ID: <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
	<Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
	<51515889.6040106@uter.be>
	<5152996E.50800@gmail.com>
	<20130328211747.GA10917@chumley.earth.sol>
	<5154C5E0.3040608@gmail.com>
	<20130328231039.GA14587@chumley.earth.sol>
	<CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
	<20130329080629.GB14587@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f176.google.com ([209.85.210.176]:42924 "EHLO
	mail-ia0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755312Ab3C2Iah (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 04:30:37 -0400
Received: by mail-ia0-f176.google.com with SMTP id i1so258202iaa.21
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 01:30:36 -0700 (PDT)
In-Reply-To: <20130329080629.GB14587@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Fri, Mar 29, 2013 at 9:06 AM, Christian T. Steigies <cts@debian.org> wrote:
> On Fri, Mar 29, 2013 at 08:56:43AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Mar 29, 2013 at 12:10 AM, Christian T. Steigies <cts@debian.org> wrote:
>> > The HID drivers seem to be enabled in the official kernel, which runs on
>> > kullervo, I don't seem to be able to switch off just the microsoft one.
>> > Maybe by modifying the generic config, but I am afraid the magical package
>> > building breaks again, genconfig.py does not run on my testing box, not sure
>> > why. In Geert's tree, memcmp is not used in the driver, thats probably why
>> > this one builds:
>> >
>> > @@ -47,9 +46,9 @@
>> >                 rdesc[559] = 0x45;
>> >         }
>> >         /* the same as above (s/usage/physical/) */
>> > -       if ((quirks & MS_RDESC_3K) && *rsize == 106 &&
>> > -                       !memcmp((char []){ 0x19, 0x00, 0x29, 0xff },
>> > -                               &rdesc[94], 4)) {
>> > +       if ((quirks & MS_RDESC_3K) && *rsize == 106 && rdesc[94] == 0x19 &&
>> > +                       rdesc[95] == 0x00 && rdesc[96] == 0x29 &&
>> > +                       rdesc[97] == 0xff) {
>> >                 rdesc[94] = 0x35;
>> >                 rdesc[96] = 0x45;
>> >         }
>> >
>> >> >buildds) another way. kernel-package?
>>
>> I reported that problem and it got fixed. Probably the fix never made it to
>> -stable?

commit 6b90466cfec2a2fe027187d675d8d14217c12d82
Author: Jiri Slaby <jslaby@suse.cz>
Date:   Mon Nov 12 10:16:09 2012 +0100

    HID: microsoft: do not use compound literal - fix build

> Yes, I was not precise. The orig is what hid-microsoft looks like in
> Debian's linux-source-3.8. The patched one is from Geert's tree, so it is
> fixed in linux-m68k. Maybe I am missing something, but I don't see anything

The fix is present in upstream

$ git tag --contains 6b90466cfec2a2fe027187d675d8d14217c12d82
linux-3.7
linux-3.7-rc6
linux-3.7-rc7
linux-3.7-rc8
linux-3.7.1
linux-3.7.10
linux-3.7.2
linux-3.7.3
linux-3.7.4
linux-3.7.5
linux-3.7.6
linux-3.7.7
linux-3.7.8
linux-3.7.9
linux-3.8
linux-3.8-rc1
linux-3.8-rc2
linux-3.8-rc3
linux-3.8-rc4
linux-3.8-rc5
linux-3.8-rc6
linux-3.8-rc7
linux-3.8.1
linux-3.8.2
linux-3.8.3
linux-3.9-rc1
linux-3.9-rc2
linux-3.9-rc3
linux-3.9-rc4

How come it's broken in Debian's 3.8?

> in the patches at first glance, only this, which makes me shiver:
>
> +       ret = hid_add_device(hid_dev);
> +       if (ret)
> +               goto probe_err1;
>
> Reminds me of fortran, are gotos legal in kernel source?

Nope, that's fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
