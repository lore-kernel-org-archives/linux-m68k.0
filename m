From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k v3.16 status update
Date: Tue, 5 Aug 2014 21:40:09 +0200
Message-ID: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

m68k v3.16 is out!
git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git

m68k-queue is getting smaller, but there are still a few commits left:

$ git cherry -v for-3.17 m68k-queue v3.16
- 7e87ff970f7116e46025f226b5aa47bd19e1229b zorro: Use ARRAY_SIZE
- 8e1bf8df8b6db30f2e78c029d488e5482b7d28d4 m68k/sun3: Remove define
statement no longer needed
+ 82560cb180860d93f5b83ac3e4048f53a1989b2d m68k/atari: EtherNAT -
ethernet support (smc91x)
+ 224ce049f71577d6ec380aeb94a4d25c3c4016a7 m68k/atari: EtherNEC -
ethernet support (ne)
+ db69080d04f14fbbd1021ac80916f8889beedab6 m68k/defconfig: Enable
Atari EtherNAT and EtherNEC Ethernet support
+ 87704cc39f16315f64c73afa19631a224322504c m68k/atari: USB - add
ISP1160 USB host controller support
+ 10b42d48867deea3c9b3ec0286e1377fe50ce616 m68k/defconfig: Enable
Atari EtherNAT and NetUSBee USB support
+ 88875720f0391465e2116defd7e050b31083734f fs/fat: Revert "msdos fs:
remove unsettable atari option"
+ 258a402647910eed4081cc23e62e4482467e1d68 fs/fat: Atari FAT updates
+ 84f65eef567df9a147073bcc240f8821af966cef fs/fat: Use correct logical
sector size for Atari GEMDOS FAT

The first two will be in v3.17.

The defconfig commits are blocked on functionality commits above them.

That leaves us with:
  - Atari EtherNAT: Should be fairly easy to get in. Is the current driver still
    working? If yes, I'm willing to send the patch to netdev myself.
  - Atari EtherNEC: idem ditto.
  - Atari ISP1160: I'm afraid this one needs a bit more care.
  - Atari FAT: No comments ;-)

May I remind you that patches touching areas outside arch/m68k must be
submitted to the appropriate maintainer (use scripts/get_maintainer.pl).

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
