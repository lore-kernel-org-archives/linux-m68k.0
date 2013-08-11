From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: truncate base in do_div
Date: Sun, 11 Aug 2013 21:57:27 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308112157110.5944@herc.mirbsd.org>
References: <871u633t27.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <871u633t27.fsf@igel.home>
Resent-Message-ID: <zTqSe6HalwB.A.H6E.XkACSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>Explicitly truncate the second operand of do_div to 32 bits to guard
>against bogus code calling it with a 64bit divisor.
>
>Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

Tested-by: Thorsten Glaser <tg@debian.org>

>---
> arch/m68k/include/asm/div64.h | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/arch/m68k/include/asm/div64.h b/arch/m68k/include/asm/div64.h
>index 444ea8a..ef881cf 100644
>--- a/arch/m68k/include/asm/div64.h
>+++ b/arch/m68k/include/asm/div64.h
>@@ -15,16 +15,17 @@
> =09=09unsigned long long n64;=09=09=09=09\
> =09} __n;=09=09=09=09=09=09=09\
> =09unsigned long __rem, __upper;=09=09=09=09\
>+=09unsigned long __base =3D (base);=09=09=09=09\
> =09=09=09=09=09=09=09=09\
> =09__n.n64 =3D (n);=09=09=09=09=09=09\
> =09if ((__upper =3D __n.n32[0])) {=09=09=09=09\
> =09=09asm ("divul.l %2,%1:%0"=09=09=09=09\
>-=09=09=09: "=3Dd" (__n.n32[0]), "=3Dd" (__upper)=09\
>-=09=09=09: "d" (base), "0" (__n.n32[0]));=09\
>+=09=09     : "=3Dd" (__n.n32[0]), "=3Dd" (__upper)=09\
>+=09=09     : "d" (__base), "0" (__n.n32[0]));=09=09\
> =09}=09=09=09=09=09=09=09\
> =09asm ("divu.l %2,%1:%0"=09=09=09=09=09\
>-=09=09: "=3Dd" (__n.n32[1]), "=3Dd" (__rem)=09=09\
>-=09=09: "d" (base), "1" (__upper), "0" (__n.n32[1]));=09\
>+=09     : "=3Dd" (__n.n32[1]), "=3Dd" (__rem)=09=09=09\
>+=09     : "d" (__base), "1" (__upper), "0" (__n.n32[1]));=09\
> =09(n) =3D __n.n64;=09=09=09=09=09=09\
> =09__rem;=09=09=09=09=09=09=09\
> })
>--=20
>1.8.3.4
>
>
>--=20
>Andreas Schwab, schwab@linux-m68k.org
>GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
>"And now for something completely different."
>
>
>--=20
>To UNSUBSCRIBE, email to debian-68k-REQUEST@lists.debian.org
>with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.=
org
>Archive: http://lists.debian.org/871u633t27.fsf@igel.home
>
>

//mirabilos
--=20
17:08=E2=8E=9C=C2=ABVutral=C2=BB fr=C3=BCher gabs keine packenden smartphon=
es und so
17:08=E2=8E=9C=C2=ABVutral=C2=BB heute gibts frauen die sind facebooks=C3=
=BCchtig
17:10=E2=8E=9C=C2=ABVutral=C2=BB aber auch traurig; fr=C3=BCher warst du al=
s nerd voll am arsch
17:10=E2=8E=9C=C2=ABVutral=C2=BB heute bist du als nerd der einzige der wir=
klich damit klarkommt
