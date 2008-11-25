From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [PATCH] MVME16x: add support for EARLY_PRINTK
Date: Tue, 25 Nov 2008 17:59:46 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811251751580.13549@localhost.localdomain>
References: <1227186532.19809.3.camel@kars.perseus.home>
 <200811250226.54137.zippel@linux-m68k.org> <1227607121.9242.5.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-vbr12.xs4all.nl ([194.109.24.32]:2160 "EHLO
	smtp-vbr12.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752225AbYKYQ7z (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Nov 2008 11:59:55 -0500
In-Reply-To: <1227607121.9242.5.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>

Hi,

On Tue, 25 Nov 2008, Kars de Jong wrote:

> Defining CONFIG_EARLY_PRINTK used to pull in some generic code, that's
> why I named it like that.

x86 is using it include some early print code, but the generic parts are 
all already available unconditionally (and early on) and IIRC always were.

> So I think I'll just define it unconditionally, and only on MVME16x it
> will actually include some extra code. Is that OK with you?

That's fine, it's up to you whether you want to activate it via config 
option or command line. In the other ports it's activated via the 
early_param debug option.

bye, Roman
