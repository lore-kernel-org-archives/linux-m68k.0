From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PATCH] big staging merge for 3.2
Date: Sat, 29 Oct 2011 14:24:19 +0200
Message-ID: <CAMuHMdW0YfSp6D9C2Jf_4UXFRtnys89Bb-woq1EQkxDx8CARQg@mail.gmail.com>
References: <20111025112629.GA10864@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111025112629.GA10864@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@osdl.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Oct 25, 2011 at 13:26, Greg KH <greg@kroah.com> wrote:
> Greg Kroah-Hartman (27):
> =C2=A0 =C2=A0 =C2=A0Staging: remove drivers/char/scc.h as it should h=
ave gone a while ago

That's commit 1ec3ba93c5fad9dca0dab272491c625fe6a2f67d
Author: Greg Kroah-Hartman <gregkh@suse.de>
Date:   Wed Aug 24 14:44:13 2011 -0700

    Staging: remove drivers/char/scc.h as it should have gone a while a=
go

    This was needed by one of the generic serial drivers that was remov=
ed a
    while ago.  No one even noticed that the driver could not be built
    properly while it was in the staging directory.

    So this removed the unneeded .h file.

    Reported-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

diff --git a/drivers/char/scc.h b/drivers/char/scc.h
deleted file mode 100644
index 341b114..0000000
--- a/drivers/char/scc.h
+++ /dev/null
@@ -1,613 +0,0 @@
-/*
- * atari_SCC.h: Definitions for the Am8530 Serial Communications Contr=
oller

=46unny, Google doesn't seem to find any evidence this patch has ever b=
een
posted on a public maling list?

Anyone, no real harm done.

Just for the record, there are two reason no one noticed that
drivers/staging/generic_serial/vme_scc.c no longer compiled:
  1. linux-next doesn't build staging,
  2. The m68k tree still has the (too long) work-in-progress atari_scc =
driver.
     The Atari SCC driver was the original user of scc.h, so when I mov=
ed that
     one to drivers/staging/ in the m68k tree, it masked compile
failures for vme_scc
     in mainline.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
