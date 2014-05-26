From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [-next] Imminent merge conflict in Documentation/kernel-parameters.txt
Date: Mon, 26 May 2014 23:03:33 +0200
Message-ID: <CAMuHMdWbV23Bd4p7BzZ1n7ge+1oAgM0F8zywxyByBTRhUfmTWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Stephen,

Just a heads up for today: the m68k tree will cause a small context conflict
in Documentation/kernel-parameters.txt.
"M68k" was added to "earlyprintk=", while some hunks have been inserted
above by someone else.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
