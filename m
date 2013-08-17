From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: nfhd performance
Date: Sat, 17 Aug 2013 14:01:09 +1200
Message-ID: <03094f45e85bca24df9306f73df2c84c@biophys.uni-duesseldorf.de>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:40678 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751787Ab3HQCBP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Aug 2013 22:01:15 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so2536885pab.29
        for <linux-m68k@vger.kernel.org>; Fri, 16 Aug 2013 19:01:14 -0700 (PDT)
In-Reply-To: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

Geert,

> So far I never really used nfhd.

On that matter - I've used it once to good effect. My 160 GB disk was 
properly recognized by nfhd but not by IDE emulation (Falcon disk 
hooked up to PC via USB adapter). IDE appears to truncate the disk size 
(number of cylinders I presume) in my rather old ARAnyM version.

(had to use ARAnyM to revive the bootstrap on my second HD after the 
primary one died on me)

>
> In a kernel that has both IDE and nfhd support, once everything is in 
> the
> buffer cache, I get:
>
> atari:~# dd if=/dev/hda2 bs=1M of=/dev/null
> 134+1 records in
> 134+1 records out
> 141114880 bytes (141 MB) copied, 5.91 seconds, 23.9 MB/s
> atari:~# dd if=/dev/nfhd8p2 bs=1M of=/dev/null
> 134+1 records in
> 134+1 records out
> 141114880 bytes (141 MB) copied, 17.09 seconds, 8.3 MB/s
>
> So nfhd is slower than emulated IDE?

That seems odd indeed ... is the disk attached as IDE or via USB 
adapter? (Checking to see whether I should get similar results)

Cheers,

	Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
