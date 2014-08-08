From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Fri, 08 Aug 2014 20:38:28 +1200
Message-ID: <53E48C84.9090709@gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert,
> m68k v3.16 is out!
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
>
> m68k-queue is getting smaller, but there are still a few commits left:
>
> $ git cherry -v for-3.17 m68k-queue v3.16
> - 7e87ff970f7116e46025f226b5aa47bd19e1229b zorro: Use ARRAY_SIZE
> - 8e1bf8df8b6db30f2e78c029d488e5482b7d28d4 m68k/sun3: Remove define
> statement no longer needed
> + 82560cb180860d93f5b83ac3e4048f53a1989b2d m68k/atari: EtherNAT -
> ethernet support (smc91x)
> + 224ce049f71577d6ec380aeb94a4d25c3c4016a7 m68k/atari: EtherNEC -
> ethernet support (ne)
> + db69080d04f14fbbd1021ac80916f8889beedab6 m68k/defconfig: Enable
> Atari EtherNAT and EtherNEC Ethernet support
> + 87704cc39f16315f64c73afa19631a224322504c m68k/atari: USB - add
> ISP1160 USB host controller support
> + 10b42d48867deea3c9b3ec0286e1377fe50ce616 m68k/defconfig: Enable
> Atari EtherNAT and NetUSBee USB support
> + 88875720f0391465e2116defd7e050b31083734f fs/fat: Revert "msdos fs:
> remove unsettable atari option"
> + 258a402647910eed4081cc23e62e4482467e1d68 fs/fat: Atari FAT updates
> + 84f65eef567df9a147073bcc240f8821af966cef fs/fat: Use correct logical
> sector size for Atari GEMDOS FAT
>
> The first two will be in v3.17.
>
> The defconfig commits are blocked on functionality commits above them.
>
> That leaves us with:
>   - Atari EtherNAT: Should be fairly easy to get in. Is the current driver still
>     working? If yes, I'm willing to send the patch to netdev myself.
>   

Last time I had a chance to try this on a non-broken EtherNAT, it was 
fine (two years ago IIRC). Need to ask Christian again to test the 
current one. There was one change you suggested after that time 
(dropping a dodgy cast was part of it) - that bit got never tested. It 
should work from what we discussed, but that's not a strong enough 
argument.

I'll leave it up to you to decide whether this is fit to submit.

>   - Atari EtherNEC: idem ditto.
>   

That one's fine. Paul had objections to the way I handled the shared 
interrupt and polling issue but that has been resolved a while ago.

Time for me to resubmit that one.

>   - Atari ISP1160: I'm afraid this one needs a bit more care.
>   

Agreed - it works but  there has to be a cleaner way to do this. I need 
to sit down and understand how it is that the current code works. (Last 
time I tried, the USB chip still worked on my EtherNAT so I can keep 
handling this.)

>   - Atari FAT: No comments ;-)
>   

I have a hard time remembering what these were about. Setting the 
'atari' option to either no or yes makes no difference, the mount works 
either way on my GEMDOS partition. The other two I suspect are needed 
(can be merged into one, anyway). I'll try to drop them and see where 
that leaves me.

I don't think I still have the test disk image I got from Petr to test 
these patches on. The patches were needed in 2009 so probably are still 
needed now. What were the objections from the FAT maintainers here?

> May I remind you that patches touching areas outside arch/m68k must be
> submitted to the appropriate maintainer (use scripts/get_maintainer.pl).
>   

There's still the Amiga Zorro ESP patch out in limbo - DaveM suggested a 
change to enable SCSI-2 features to help with extended message bytes but 
that did not work as intended. Haven't had time to follow that one up. 
Tuomas' fix to the driver to bypass DMA for message in works OK though - 
do you want it submitted back to linux-scsi as is, or wait for a perfect 
solution (pun on me ...)?

Support for more Amiga ESP cards needs to be added (got dropped in 
overlapping edits between Tuomas and me, better to make a clean break 
there). More testers needed at any rate.
Conclusion - I see good chances on the EtherNEC one, ditto on the 
EtherNAT if we can get it tested. Need to go back and check the FAT 
stuff but would suspect it is still needed - if no one but me needs this 
it could keep living in my local tree though.

Leaves USB to clean up, and SCSI stuff (which is what I have mostly been 
working on (Atari), if any).

Not much help, I know. I need a clone or two.

Cheers,

    Michael

> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
