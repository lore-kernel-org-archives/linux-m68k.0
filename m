From: Brad Boyer <flar@allandria.com>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Sat, 25 May 2013 12:33:01 -0700
Message-ID: <20130525193301.GB10275@cynthia.pants.nu>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:45534 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757785Ab3EYTdG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 May 2013 15:33:06 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitzmic@gmail.com>

On Thu, May 23, 2013 at 09:19:10PM +0200, Geert Uytterhoeven wrote:
> I pushed out an RFC for a long-overdue update of the m68k defconfig
> files to my defconfig branch:
> 
> arch/m68k/configs/mac_defconfig ------------------+
> CONFIG_MAC_PARTITION                  : y y y y y . y y y y y .

Shouldn't MAC_PARTITION be enabled for the mac configuration?

	Brad Boyer
	flar@allandria.com
