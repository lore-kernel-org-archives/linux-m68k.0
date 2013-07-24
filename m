From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 22:04:56 +0200
Message-ID: <1374696296.27253.5.camel@pracovni>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
	 <87li4wpc79.fsf@igel.home>
	 <Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org>
	 <loom.20130724T152350-539@post.gmane.org>
	 <alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
	 <1374678140.18072.10.camel@pracovni>
	 <CAMuHMdXNBMgHoA50Ek=edWB7jrGTWJogBMTMfDwjDF6SMVU3Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:49670 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752070Ab3GXUFH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 16:05:07 -0400
In-Reply-To: <CAMuHMdXNBMgHoA50Ek=edWB7jrGTWJogBMTMfDwjDF6SMVU3Dw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

Geert Uytterhoeven p=ED=B9e v St 24. 07. 2013 v 18:19 +0200:
> On Wed, Jul 24, 2013 at 5:02 PM, Petr Stehlik <pstehlik@sophics.cz> w=
rote:
> >> ARAnyM hackers: What's the maximum size of ID names?
> >
> > There isn't any given limit AFAIK, it's based on a common sense whe=
n
> > creating a new NatFeat name.
>=20
> Understood :-) What's the size of the longest name in use?

aranym/src/natfeat$ grep name\(\) * | grep return
debugprintf.h:	const char *name() { return "DEBUGPRINTF"; }
ethernet.h:	const char *name() { return "ETHERNET"; }
hostfs.h:	const char *name() { return "HOSTFS"; }
nfaudio.h:	const char *name() { return "AUDIO"; }
nf_basicset.h:	const char *name() { return "NF_NAME"; }
nf_basicset.h:	const char *name() { return "NF_VERSION"; }
nf_basicset.h:	const char *name() { return "NF_SHUTDOWN"; }
nf_basicset.h:	const char *name() { return "NF_STDERR"; }
nfbootstrap.h:	const char *name() { return "BOOTSTRAP"; }
nfcdrom.h:	const char *name() { return "CDROM"; }
nfclipbrd.h:	const char *name() { return "CLIPBRD"; }
nfjpeg.h:	const char *name() { return "JPEG"; }
nfosmesa.h:	const char *name() { return "OSMESA"; }
nfpci.h:	const char *name() { return "PCI"; }
nfvdi.h:	const char *name() { return "fVDI"; }
usbhost.h:	const char *name() { return "USBHOST"; }
xhdi.h:		const char *name() { return "XHDI"; }

> Is 32 OK?

yes, for now :)

Petr
