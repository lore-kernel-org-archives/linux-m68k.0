From: Jeff Garzik <jeff@garzik.org>
Subject: Re: [git] m68k
Date: Tue, 02 Dec 2008 17:52:04 -0500
Message-ID: <4935BC14.5060109@garzik.org>
References: <Pine.LNX.4.64.0812022117160.24347@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from srv5.dvmed.net ([207.36.208.214]:40076 "EHLO mail.dvmed.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751944AbYLBWwR (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 2 Dec 2008 17:52:17 -0500
In-Reply-To: <Pine.LNX.4.64.0812022117160.24347@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Geert Uytterhoeven wrote:
> 	Hi Linus,
> 
> [ First pull request, let's hope I got everything right... ]
> 
> Please pull from
> 
>     git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
> 
> to receive the following m68k-related updates for 2.6.28:
> 
> Finn Thain (1):
>       macfb: Do not overflow fb_fix_screeninfo.id
> 
> Geert Uytterhoeven (1):
>       m68k: Update defconfigs for 2.6.28-rc7
> 
>  arch/m68k/configs/amiga_defconfig    |  126 +++++++++++++++++++--------------
>  arch/m68k/configs/apollo_defconfig   |  115 +++++++++++++++++-------------
>  arch/m68k/configs/atari_defconfig    |  130 +++++++++++++++++++---------------
>  arch/m68k/configs/bvme6000_defconfig |  112 +++++++++++++++++-------------
>  arch/m68k/configs/hp300_defconfig    |  115 +++++++++++++++++-------------
>  arch/m68k/configs/mac_defconfig      |  125 ++++++++++++++++++--------------
>  arch/m68k/configs/multi_defconfig    |  129 +++++++++++++++++++---------------
>  arch/m68k/configs/mvme147_defconfig  |  112 +++++++++++++++++-------------
>  arch/m68k/configs/mvme16x_defconfig  |  112 +++++++++++++++++-------------
>  arch/m68k/configs/q40_defconfig      |  125 +++++++++++++++++++--------------
>  arch/m68k/configs/sun3_defconfig     |  124 +++++++++++++++++++-------------
>  arch/m68k/configs/sun3x_defconfig    |  115 +++++++++++++++++-------------
>  drivers/video/macfb.c                |   74 +++++++++----------
>  13 files changed, 863 insertions(+), 651 deletions(-)

As a peer git user...  Looks pretty good to me, though I would suggest 
including the overall diff in the email [provided it is under 400k]. 
One last chance for review never hurts, especially during the -rc period.

	Jeff



