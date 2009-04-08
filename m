From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/10] MAINTAINERS - Add file patterns
Date: Wed, 8 Apr 2009 08:59:54 +0200
Message-ID: <10f740e80904072359n49ab104fjc545fa9f4617d5ad@mail.gmail.com>
References: <1239167872-8179-1-git-send-email-joe@perches.com>
	 <1239167872-8179-3-git-send-email-joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1239167872-8179-3-git-send-email-joe@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@kernel.org>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org

On Wed, Apr 8, 2009 at 07:17, Joe Perches <joe@perches.com> wrote:
> Better description of file pattern tag "F:"
> Add file exclusion tag "X:"
> Add patterns to sections
>
> Signed-off-by: Joe Perches <joe@perches.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3b2159..a8034dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -55,422 +55,522 @@ trivial patch so apply some common sense.

> =C2=A0M68K ARCHITECTURE
> =C2=A0P: =C2=A0 =C2=A0 Geert Uytterhoeven
> =C2=A0M: =C2=A0 =C2=A0 geert@linux-m68k.org
> =C2=A0P: =C2=A0 =C2=A0 Roman Zippel
> =C2=A0M: =C2=A0 =C2=A0 zippel@linux-m68k.org
> =C2=A0L: =C2=A0 =C2=A0 linux-m68k@lists.linux-m68k.org
> =C2=A0W: =C2=A0 =C2=A0 http://www.linux-m68k.org/
> =C2=A0T: =C2=A0 =C2=A0 git git.kernel.org/pub/scm/linux/kernel/git/ge=
ert/linux-m68k.git
> =C2=A0S: =C2=A0 =C2=A0 Maintained
> +F: =C2=A0 =C2=A0 arch/m68k/

You can add drivers/zorro/ (Amiga Zorro bus) there, too

> =C2=A0M68K ON APPLE MACINTOSH
> =C2=A0P: =C2=A0 =C2=A0 Joshua Thompson
> =C2=A0M: =C2=A0 =C2=A0 funaho@jurai.org
> =C2=A0W: =C2=A0 =C2=A0 http://www.mac.linux-m68k.org/
> =C2=A0L: =C2=A0 =C2=A0 linux-m68k@lists.linux-m68k.org
> =C2=A0S: =C2=A0 =C2=A0 Maintained

That would be arch/m68k/mac/

> =C2=A0M68K ON HP9000/300
> =C2=A0P: =C2=A0 =C2=A0 Philip Blundell
> =C2=A0M: =C2=A0 =C2=A0 philb@gnu.org
> =C2=A0W: =C2=A0 =C2=A0 http://www.tazenda.demon.co.uk/phil/linux-hp
> =C2=A0S: =C2=A0 =C2=A0 Maintained
> +F: =C2=A0 =C2=A0 arch/m68k/hp300/

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
