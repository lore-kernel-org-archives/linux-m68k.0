From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 17:23:55 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1307241723110.6532@herc.mirbsd.org>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org> <87li4wpc79.fsf@igel.home>
 <Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org> <loom.20130724T152350-539@post.gmane.org>
 <alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:48433 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800Ab3GXR2h convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 13:28:37 -0400
In-Reply-To: <alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, aranym@lists.bobek.cz

Geert Uytterhoeven dixit:

>The patch below adds a wrapper that copies the (supposedly short) name=
 to
>the kernel stack before calling into ARAnyM.

Is that enough? What about buffers and all that?

Sorry, won=E2=80=99t be testing these patches for a while,
I need to concentrate on the Debian sid kernel for now.

bye,
//mirabilos
--=20
<ch> you introduced a merge commit        =E2=94=82<mika> % g rebase -i=
 HEAD^^
<mika> sorry, no idea and rebasing just fscked =E2=94=82<mika> Segmenta=
tion
<ch> should have cloned into a clean repo      =E2=94=82  fault (core d=
umped)
<ch> if I rebase that now, it's really ugh     =E2=94=82<mika:#grml> wu=
ahhhhhh
