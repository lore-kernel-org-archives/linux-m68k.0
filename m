From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: ARAnyM 0.9.13 with MPFR even for Lucid
Date: Fri, 23 Mar 2012 14:54:27 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1203231451400.8840@herc.mirbsd.org>
References: <1332282242.3352.7.camel@aspire>  <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
  <1332322473.10247.56.camel@petr>  <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
  <1332337279.5083.3.camel@aspire>  <CAMuHMdXLUEYpiGrHrtDw=MjSZn3yZ1Of8TLf4wPmiDr9grpreg@mail.gmail.com>
 <1332505616.22403.27.camel@petr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <1332505616.22403.27.camel@petr>
Resent-Message-ID: <bGPUTXBrLtO.A.MMG.E9IbPB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>, Antonin Kral <A.Kral@sh.cvut.cz>
List-Id: linux-m68k@vger.kernel.org

Petr Stehlik dixit:

>I couldn't stand the feeling that Geert cannot enjoy new Andreas' MPFR
>FPU emulation in ARAnyM so I have backported the libmpfr4 for Lucid:

I=E2=80=99ve built mpfr4 for hardy and am now fighting with the PPA.
Should be there soon. I renamed the -dev package into libmpfr4-dev
to have this not be picked up by ANYTHING else in the system.

>And I have also released a new version of ARAnyM that includes another
>fix that Andreas made two days ago:
>
>http://sourceforge.net/projects/aranym/files/aranym/0.9.13/

Mh. I=E2=80=99ll backport the src:aranym from sid once its maintainer (Cc=
=E2=80=99d)
has made the upload. Will post here then. (In the hope it doesn=E2=80=99t
use too many =E2=80=9Cnew Debian=E2=80=9D features=E2=80=A6)

My other hosts use lenny (let=E2=80=99s just keep that alone, or maybe
I take my hardy source packages) and sid (so no issue once
Antonin has uploaded).

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
=09=09=09=09=09=09-- Edward Burr
