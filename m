From: Brad Boyer <flar@allandria.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: reorganize Kconfig options to
 improve mmu/non-mmu selections
Date: Thu, 11 Aug 2011 21:30:22 -0700
Message-ID: <20110812043022.GB4940@cynthia.pants.nu>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com>
 <20110811061522.GC21757@merkur.ravnborg.org>
 <4E437A0B.3030201@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:58378 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab1HLEum (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 12 Aug 2011 00:50:42 -0400
Content-Disposition: inline
In-Reply-To: <4E437A0B.3030201@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Aug 11, 2011 at 04:43:23PM +1000, Greg Ungerer wrote:
> >Do you really need EISA, MCA and PCMIA? They have no promt thus cannot be selected by the user.
> 
> Yes, your right, they don't look like than can be selected at all.
> None of the default configs seem to reference them either.
> Geert: do you know why these options might still be around?
> 

It still hasn't been cleaned up enough to go in, but somebody posted
a trex driver which would need PCMCIA. It was a driver for the card
slots in the Macintosh PowerBook 190.

In theory some other m68k systems have PCMCIA slots that could be
supported as well. I'm sure they're almost as broken and non-standards
compliant as what Apple did.

	Brad Boyer
	flar@allandria.com
