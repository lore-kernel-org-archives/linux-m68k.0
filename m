From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: Re: [PATCH 0/8] Amiga XSurf100 patch series, to be submitted to linux-net
Date: Tue, 17 Nov 2015 19:16:22 +0100
Message-ID: <564B6EF6.2020207@mkarcher.dialup.fu-berlin.de>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdXOFEgB5diqNdz8QTQHDUecz0naQ+G594JmZztg+h+DTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43549 "EHLO
	outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751617AbbKQSQZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 17 Nov 2015 13:16:25 -0500
In-Reply-To: <CAMuHMdXOFEgB5diqNdz8QTQHDUecz0naQ+G594JmZztg+h+DTQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 17.11.2015 09:18, Geert Uytterhoeven wrote:
> Please don't put drivers in arch/m68k/. drivers/net is fine for a
> pure-net driver. 
There is a USB daughterboard on the XSurf 100 card, so it will no longer
be pure-net if that daughterboard is installed.

See http://wiki.icomp.de/wiki/X-Surf-100 and
http://wiki.icomp.de/wiki/RapidRoad.

Regards,
  Michael Karcher
