From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: nfhd performance
Date: Fri, 16 Aug 2013 23:57:18 +0200
Message-ID: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:54221 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224Ab3HPW1k (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Aug 2013 18:27:40 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so2759467pdj.40
        for <linux-m68k@vger.kernel.org>; Fri, 16 Aug 2013 15:27:40 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

So far I never really used nfhd.

In a kernel that has both IDE and nfhd support, once everything is in the
buffer cache, I get:

atari:~# dd if=/dev/hda2 bs=1M of=/dev/null
134+1 records in
134+1 records out
141114880 bytes (141 MB) copied, 5.91 seconds, 23.9 MB/s
atari:~# dd if=/dev/nfhd8p2 bs=1M of=/dev/null
134+1 records in
134+1 records out
141114880 bytes (141 MB) copied, 17.09 seconds, 8.3 MB/s

So nfhd is slower than emulated IDE?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
