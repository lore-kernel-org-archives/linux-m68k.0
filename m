From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 16:56:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org> <87li4wpc79.fsf@igel.home> <Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org> <loom.20130724T152350-539@post.gmane.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:56718 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab3GXO4c convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 10:56:32 -0400
In-Reply-To: <loom.20130724T152350-539@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, aranym@lists.bobek.cz

On Wed, 24 Jul 2013, Thorsten Glaser wrote:
> Thorsten Glaser <tg <at> mirbsd.de> writes:
> > Andreas Schwab dixit:
> > >The problem is that aranym expects the parameters of the natfeat c=
alls
> > >to be physical addresses.  The nf_get_id calls use literal strings=
 as
> > >parameters which only works when the drivers are builtin because p=
hys =3D=3D
> > >virt then.

And fixing the conversion is non-trivial, as module memory is allocated=
 using
vmalloc(), which may be non-contiguous in physical memory space, right?

> > Ah, right, there was that issue=E2=80=A6 so this patch should proba=
bly go in?
>=20
> At first, anyway.

I prefer a fix to go in instead :-)

> Maybe if CONFIG_NATFEAT is selected (it=E2=80=99s bool), some bounce =
buffer could
> be allocated and memlocked, which the other NF* drivers can then use.
> (If NatFeat is not found during boot, no memory should be allocated.)
>=20
> Especially if we had more NF* drivers in the future (hostfs could be =
made
> into something, maybe with something like umsdos on top for Unix file
> permissions? And I=E2=80=99m hoping for a bidirectional =E2=80=9Cvirt=
io/serial=E2=80=9D console=E2=80=A6)
> this could be useful sharing, and not needing to have everything else
> in the kernel statically.
>=20
> Well, if someone has time and wants to write this.

It doesn't have to be that complex...

The patch below adds a wrapper that copies the (supposedly short) name =
to
the kernel stack before calling into ARAnyM.
Does this make modular NatFeat drivers work for you?
It doesn't break the built-in drivers for me.

ARAnyM hackers: What's the maximum size of ID names?

diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
index cb574ae..98655ef 100644
--- a/arch/m68k/emu/natfeat.c
+++ b/arch/m68k/emu/natfeat.c
@@ -19,9 +19,11 @@
 #include <asm/machdep.h>
 #include <asm/natfeat.h>
=20
+extern long nf_get_id2(const char *feature_name);
+
 asm("\n"
-"	.global nf_get_id,nf_call\n"
-"nf_get_id:\n"
+"	.global nf_get_id2,nf_call\n"
+"nf_get_id2:\n"
 "	.short	0x7300\n"
 "	rts\n"
 "nf_call:\n"
@@ -30,12 +32,24 @@ asm("\n"
 "1:	moveq.l	#0,%d0\n"
 "	rts\n"
 "	.section __ex_table,\"a\"\n"
-"	.long	nf_get_id,1b\n"
+"	.long	nf_get_id2,1b\n"
 "	.long	nf_call,1b\n"
 "	.previous");
-EXPORT_SYMBOL_GPL(nf_get_id);
 EXPORT_SYMBOL_GPL(nf_call);
=20
+long nf_get_id(const char *feature_name)
+{
+	char name_copy[32]; // FIXME maximum size of ID names?
+	size_t n;
+
+	n =3D strlcpy(name_copy, feature_name, sizeof(name_copy));
+	if (n >=3D sizeof(name_copy))
+		return 0;
+
+	return nf_get_id2(name_copy);
+}
+EXPORT_SYMBOL_GPL(nf_get_id);
+
 void nfprint(const char *fmt, ...)
 {
 	static char buf[256];

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
