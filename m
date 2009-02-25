From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Subject: Re: [Linux-fbdev-devel] [PATCH 4/4] cirrusfb: fix error paths in
	cirrusfb_xxx_register()
Date: Wed, 25 Feb 2009 09:48:40 +0100
Message-ID: <10f740e80902250048j31a9a2c5n5c39066ba156c10d__34519.0742555589$1235553631$gmane$org@mail.gmail.com>
References: <20090224223702.86f7e129.krzysztof.h1@poczta.fm>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090224223702.86f7e129.krzysztof.h1@poczta.fm>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: Linux-fbdev-devel <linux-fbdev-devel@lists.sourceforge.net>, Andrew Morton <akpm@linux-foundation.org>, linux-m68k@lists.linux-m68k.org

Hi Krzysztof,

On Tue, Feb 24, 2009 at 22:37, Krzysztof Helt <krzysztof.h1@poczta.fm> wrote:
> It is not an end to cirrusfb patches unfortunately.
> I have just got a GD5446 (Picasso4) and it locks up
> my computer when the cirrusfb module is loaded.
> Time to fix this model as well...

Cool! Which Amiga model do you have?

The Picasso4 is also not yet supported in Zorro II mode. There are some docs
available (it's just about using the right offsets), but as I don't
have the hardware,
I never did it myself. Christian Steigies is probably most interested...

Gr{oetje,eeting}s,


     Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
