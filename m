From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Sun, 26 Jun 2011 14:21:13 +0200
Message-ID: <BANLkTinrcVBmcu6v7er5ZZ4GgMJ1TabM_w@mail.gmail.com>
References: <1308894337-11421-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1308894337-11421-1-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, Jun 24, 2011 at 07:45,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The following patch merges the mmu and non-mmu versions of the m68k
> bitops.h files. Now there is a good deal of difference between the two
> files, but none of it is actually an mmu specific difference. It is
> all about the specific m68k/coldfire varient we are targeting. So it
> makes an awful lot of sense to merge these into a single bitops.h.
>
> There is a number of ways I can see to factor this code. The approach
> I have taken here is to keep the various versions of each macro/function
> type together. This means that there is some ifdefery with each to handle
> each CPU type. I have introduced a new config option so that processors
> that support the more advanced bit field instructions can select that.
> It keeps the ifdefs a little cleaner at least.
>
> I have added some comments in a couple of appropriate places to try
> and make it clear what the differences we are dealing with are.
> Specifically the instruction and addressing mode differences we have
> to deal with.
>
> The merged form keeps the same underlying optimizations for each CPU
> type for all the general bit clear/set/change and find bit operations.
> It does switch to using the generic le operations though, instead of
> any local varients.
>
> Build tested on ColdFire, 68328, 68360 (which is cpu32) and 68020+.
> Run tested on ColdFire and ARAnyM.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Thanks!

If you fix the indentation and spacing problems reported by checkpatch, you
can add my
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
