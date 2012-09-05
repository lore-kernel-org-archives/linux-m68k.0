From: "Stany MARCEL" <smarcel@pactenovation.fr>
Subject: =?iso-8859-1?Q?RE=A0=3A_=5BPATCH_3/3=5D_Add_support_to_M54xx_DMA_FEC_Driv?=
	=?iso-8859-1?Q?er?=
Date: Wed, 5 Sep 2012 12:48:31 +0200
Message-ID: <1512C13C0C5EA947AE50B9B9AC314F4701B00E08@ATLAS.pactenovation.fr>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com> <1345551531-15348-3-git-send-email-stany.marcel@novasys-ingenierie.com> <503C5C5C.8000901@snapgear.com> <20120905091426.GA16015@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>, Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org

Hi,

I made a lot of cleanup in my patches, I hope to have some time next we=
ek to run my ethernet tests on my board test bench.

If no regressions are identified I'll resubmit my patch.

Regards,

Stany


-------- Message d'origine--------
De: Philippe De Muyter [mailto:phdm@macqel.be]
Date: mer. 05/09/2012 11:14
=C0: Greg Ungerer
Cc: Stany MARCEL; linux-m68k@lists.linux-m68k.org; geert@linux-m68k.org=
; linux-kernel@vger.kernel.org
Objet : Re: [PATCH 3/3] Add support to M54xx DMA FEC Driver
=20
Hi Stany & Greg

Seeing that I was not the only one wanting to have the m54xx fec dma
driver merged in, and hoping to compare Stany's version to mine,
I have rebased (step by step) my patch from v2.38 to v3.6rc2.
The driver still works and perhaps even better due to some fixes
in other m68k area.

Unfortunately I have not being able to compare it yet fully with Stany'=
s
version because Stany's patch 2/2 did not apply (using `git am') to v3.=
5
or v3.6rc2.

I have checked my patch using a recent version of checkpatch.pl (not th=
e
v3.5 version, because v3.5 version of checkpatch.pl fails with :
Nested quantifiers in regex; marked by <-- HERE in m/(\((?:[^\(\)]++ <-=
- HERE |(
?-1))*\))/ at scripts/checkpatch.pl line 340.))

and I am now at :
    464 WARNING: line over 80 characters
     90 WARNING: Use of volatile is usually wrong: see Documentation/vo=
latile-considered-harmful.txt

Many "volatile" warnings are about such definitions :

#define FEC_FECFRST(x)                 (*(volatile unsigned int *)(x + =
0x1C4))
which are afterwards used with

+       FEC_FECFRST(base_addr) |=3D FEC_SW_RST;
+       FEC_FECFRST(base_addr) &=3D ~FEC_SW_RST;
+               FEC_FECFRST(base_addr) |=3D FEC_SW_RST;
+               FEC_FECFRST(base_addr) &=3D ~FEC_SW_RST;
+       FEC_FECFRST(base_addr) |=3D FEC_SW_RST | FEC_RST_CTL;
+       FEC_FECFRST(base_addr) &=3D ~FEC_SW_RST;

Any advice about those ones ?

while many "80 characters" ones are about :
#4014: FILE: arch/m68k/platform/coldfire/MCD_tasks.c:2406:
+       0x6000000b, /* 0098(:1560):      DRD2A: EU0=3D0 EU1=3D0 EU2=3D0=
 EU3=3D11 EXT ini
t=3D0 WS=3D0 RS=3D0 */

I would like to keep those lines intact because the comment seems to ac=
tually
be the assembler source of the hex value at left, which seems to be a
microcode, and it makes sense to me to keep that on one line.  What do
you think about that ?

I did not include the current status of the patch because of its size
(I did not separate the dma part of the ethernet driver part because
the dma part is useless without the ethernet driver, and linking the
ethernet driver cannot succeed without the dma part), but if you ask,
I'll send it privately.

Best regards

Philippe

--=20
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Brux=
elles
