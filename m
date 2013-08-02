From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: linux 3.10.1 with initrd (was Re: linux 3.8.12-1 (atari flavour) does not boot)
Date: Fri, 2 Aug 2013 21:08:27 +1200
Message-ID: <0f1d3739660c2bece613948285afd937@biophys.uni-duesseldorf.de>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de> <CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com> <Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org> <5192331E.9010009@debian.org> <Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org> <20130514144112.GH11842@chumley.earth.sol> <Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org> <Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org> <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: multipart/alternative; boundary=Apple-Mail-1--157167491
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
Resent-Message-ID: <Do03S52JxS.A.WOC.9q3-RB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mikael Pettersson <mikpe@it.uu.se>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org


--Apple-Mail-1--157167491
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=UTF-8;
	delsp=yes;
	format=flowed

Hi Geert,

>> [    0.160000] WARNING: at /root/linux-3.10.1/init/main.c:698 =20
>> do_one_initcall+0x12e/0x13a()
>> [    0.160000] initcall param_sysfs_init+0x0/0x1a4 returned with =20
>> disabled interrupts
>>
>> This seems to happen for several initcalls. Geert et al,
>> can you have a look at them, they=E2=80=99re scary =E2=98=BA
>
> It only happens on multi-platform kernels, because of the following =20=

> definition
> of ALLOWINT:
>
> #if defined(MACH_ATARI_ONLY)
>         /* block out HSYNC =3D ipl 2 on the atari */
> #define ALLOWINT        (~0x500)
> #else
>         /* portable version */
> #define ALLOWINT        (~0x700)
> #endif /* machine compilation types */
>
> On an Atari-only kernel, flags is either 0x00c02204 or 0x00c02214.
> Hence "flags & ~ALLOWINT" is "flags & 0x500" is always zero.
>
> On a multi-platform kernel, flags is one of 0x00c02004, 0x00c02014,
> 0x00c02204, or 0x00c02214.
> Hence "flags & ~ALLOWINT" is "flags & 0x700" is sometimes non-zero,
> triggering the warning.
>
> Anyone who sees a solution that doesn't involve adding a variable to =20=

> hold
> ALLOWINT?
>
> We're already having a check for Q40 in arch_local_irq_enable()
> (in multi-platfom kernels only).

Didn't we have that sorted out earlier? I seem to recall this has =20
surfaced before.

What is the cause of the problem exactly - the hsync handler changing =20=

the IPL to block out further interrupts, whenever it is called for the =20=

first time after interrupts are enabled? We could stop doing that on =20
multi-platform kernels (taking all hsync interrupts will be a =20
performance hit but not stop the system from working).

Cheers,

	Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- =20
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a =20
> hacker. But
> when I'm talking to journalists I just say "programmer" or something =20=

> like that.
>                                 -- Linus Torvalds
>
>
> --
> To UNSUBSCRIBE, email to debian-68k-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact =20
> listmaster@lists.debian.org
> Archive: =20
> http://lists.debian.org/=20
> CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=3De_EJN4b1cqdbcRqgC7ABg@mail.gmail.com

--Apple-Mail-1--157167491
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=UTF-8

Hi Geert,


<excerpt><excerpt>[    0.160000] WARNING: at
/root/linux-3.10.1/init/main.c:698 do_one_initcall+0x12e/0x13a()

[    0.160000] initcall param_sysfs_init+0x0/0x1a4 returned with
disabled interrupts


This seems to happen for several initcalls. Geert et al,

can you have a look at them, they=E2=80=99re scary
<fontfamily><param>OpenSymbol</param>=E2=98=BA

</fontfamily></excerpt><fontfamily><param>OpenSymbol</param>

</fontfamily>It only happens on multi-platform kernels, because of the
following definition

of ALLOWINT:


#if defined(MACH_ATARI_ONLY)

        /* block out HSYNC =3D ipl 2 on the atari */

#define ALLOWINT        (~0x500)

#else

        /* portable version */

#define ALLOWINT        (~0x700)

#endif /* machine compilation types */


On an Atari-only kernel, flags is either 0x00c02204 or 0x00c02214.

Hence "flags & ~ALLOWINT" is "flags & 0x500" is always zero.


On a multi-platform kernel, flags is one of 0x00c02004, 0x00c02014,

0x00c02204, or 0x00c02214.

Hence "flags & ~ALLOWINT" is "flags & 0x700" is sometimes non-zero,

triggering the warning.


Anyone who sees a solution that doesn't involve adding a variable to
hold

ALLOWINT?


We're already having a check for Q40 in arch_local_irq_enable()

(in multi-platfom kernels only).

</excerpt>

Didn't we have that sorted out earlier? I seem to recall this has
surfaced before.=20


What is the cause of the problem exactly - the hsync handler changing
the IPL to block out further interrupts, whenever it is called for the
first time after interrupts are enabled? We could stop doing that on
multi-platform kernels (taking all hsync interrupts will be a
performance hit but not stop the system from working).=20


Cheers,


	Michael



<excerpt>

Gr{oetje,eeting}s,


                        Geert


--

Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
geert@linux-m68k.org


In personal conversations with technical people, I call myself a
hacker. But

when I'm talking to journalists I just say "programmer" or something
like that.

                                -- Linus Torvalds



--

To UNSUBSCRIBE, email to debian-68k-REQUEST@lists.debian.org

with a subject of "unsubscribe". Trouble? Contact
listmaster@lists.debian.org

Archive:
=
http://lists.debian.org/CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=3De_EJN4b1cqdbcRqgC7=
ABg@mail.gmail.com

</excerpt>=

--Apple-Mail-1--157167491--
