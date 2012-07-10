From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atafb and X/fbdev
Date: Wed, 11 Jul 2012 10:57:15 +1200
Message-ID: <CAOmrzk+uSw+o1rzoZP5Xz5usFwYm1Fc8-0-dJRq+uh6dV4La8Q@mail.gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
	<4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
	<CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>
	<Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org>
	<Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org>
	<4FF90ECF.2090001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61901 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754703Ab2GJW5Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jul 2012 18:57:16 -0400
Received: by pbbrp8 with SMTP id rp8so958508pbb.19
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jul 2012 15:57:15 -0700 (PDT)
In-Reply-To: <4FF90ECF.2090001@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Thorsten,

> There is a 16 bpp mode - look for 'hicolor' in the source. From my
> understanding,
> it has all been wired up right (to be honest, I did only rewrite the fbcon
> interface
> for 2.6 onwards, and touched as little of the business end of the driver as
> possible).

The mode is named TrueColor in GEM - I just cannot seem to chose it.
Any hints welcome.

If all else fails I'll hack a truecolor command line option into atafb :-)

Cheers,

  Michael
