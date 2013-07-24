From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 17:02:20 +0200
Message-ID: <1374678140.18072.10.camel@pracovni>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
	 <87li4wpc79.fsf@igel.home>
	 <Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org>
	 <loom.20130724T152350-539@post.gmane.org>
	 <alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:50558 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752163Ab3GXPkx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 11:40:53 -0400
In-Reply-To: <alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, aranym@lists.bobek.cz

Geert Uytterhoeven p=ED=B9e v St 24. 07. 2013 v 16:56 +0200:
> > > >The problem is that aranym expects the parameters of the natfeat=
 calls
> > > >to be physical addresses.  The nf_get_id calls use literal strin=
gs as
> > > >parameters which only works when the drivers are builtin because=
 phys =3D=3D
> > > >virt then.
>=20
> And fixing the conversion is non-trivial, as module memory is allocat=
ed using
> vmalloc(), which may be non-contiguous in physical memory space, righ=
t?

Sounds like the original design decision of NatFeats to use ASCII names
instead of cryptic integer codes wasn't that smart.

> ARAnyM hackers: What's the maximum size of ID names?

There isn't any given limit AFAIK, it's based on a common sense when
creating a new NatFeat name.

Petr
