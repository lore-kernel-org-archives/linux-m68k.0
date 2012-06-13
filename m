From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: asm/kvm_para.h from asm-generic (was: Re: linux-next: triage for
 April 19, 2012)
Date: Wed, 13 Jun 2012 14:49:21 +0200
Message-ID: <CAMuHMdUw6fCcNmUmpzLfYkfKz1W=9E2o24VUiheLDGJdU58qAg@mail.gmail.com>
References: <CAMuHMdW9D4FZSUibcd+qrtM+is75FyJXj+RxK+sb33XEjczdyg@mail.gmail.com>
	<CAMuHMdVM3zn_OUAtGTV_O0d3yFWBM5b_6ORHxaMLVE27Cf_XrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVM3zn_OUAtGTV_O0d3yFWBM5b_6ORHxaMLVE27Cf_XrQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Avi Kivity <avi@redhat.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, kvm@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, Jun 13, 2012 at 2:46 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> "make headers_check" is also broken on m32r since Avi's fix, as m32r
> doesn't even
> have <asm/kvm_param.h>:

BTW, you don't need to install any cross-compilers for headers_check, j=
ust do

make ARCH=3Dxxx headers_check

if you want to give it a try...

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
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
