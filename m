From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH m68k resent] allow ioremapping top of memory
Date: Tue, 22 Dec 2009 20:08:46 +0100
Message-ID: <10f740e80912221108v685ce65k2715ff96733bde43@mail.gmail.com>
References: <20091206192841.GA23088@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:58058 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752055AbZLVTIs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 Dec 2009 14:08:48 -0500
In-Reply-To: <20091206192841.GA23088@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Sun, Dec 6, 2009 at 20:28, Philippe De Muyter <phdm@macqel.be> wrote=
:
> The test in __ioremap to reject memory ranges crossing the 0 boundary
> rejects also memory ranges ending at the end of the memory. =C2=A0Fix=
 that.

Thanks, will take it.

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
