From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k: kernel/up.c:16: error: dereferencing pointer to incomplete type
Date: Thu, 12 Mar 2009 14:08:57 +0100
Message-ID: <10f740e80903120608v314be360u30911fa003ab5ebc__26047.375080134$1236863804$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org

Hi Stephen,

I can't seem to reproduce the compile failure of kernel/up.c on m68k,
as shown on
http://kisskb.ellerman.id.au/kisskb/buildresult/186066/:

| kernel/up.c:16: error: dereferencing pointer to incomplete type

I am using the exact same version (ebdcc81c71937b30e09110c02a1e8a21fa770b6f).
I'm using a different compiler, though (gcc 4.1.2).

If it is reproducible, can you please send me kernel/up.i?

Thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
