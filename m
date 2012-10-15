From: "Stany MARCEL" <smarcel@pactenovation.fr>
Subject: RE: [PATCH 1/4] Add linux/io.h to make it compile
Date: Mon, 15 Oct 2012 16:06:47 +0200
Message-ID: <1512C13C0C5EA947AE50B9B9AC314F470343F024@ATLAS.pactenovation.fr>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com> <20121015135829.GA3961@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gpn92sys-242-163.cnt.nerim.net ([195.5.242.163]:39567 "EHLO
	ATLAS.pactenovation.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750829Ab2JOORg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 10:17:36 -0400
Content-class: urn:content-classes:message
In-Reply-To: <20121015135829.GA3961@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hello Philippe,

It does not compile with my config (MMU on), io.h header is missing for=
 __raw_* operations.

But it might compile with MMU disabled.

Regards

-----Message d'origine-----
De=A0: Philippe De Muyter [mailto:phdm@macqel.be]=20
Envoy=E9=A0: lundi 15 octobre 2012 15:58
=C0=A0: Stany MARCEL
Cc=A0: linux-m68k@vger.kernel.org; gerg@uclinux.org
Objet=A0: Re: [PATCH 1/4] Add linux/io.h to make it compile

Hello Stany,

On Mon, Oct 15, 2012 at 02:54:37PM +0200, Stany MARCEL wrote:

> [PATCH 1/4] Add linux/io.h to make it compile

You could probably be more precise in your patch title :)

What error message did you get without your patch ?

I compile m54xx_wdt.c without CONFIG_MMU without error.

Best regards

Philippe
