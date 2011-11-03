From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k: add ColdFire FPU support for the V4e ColdFire
 CPU's
Date: Thu, 3 Nov 2011 17:53:16 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1111031752060.2899@nippy.intranet>
References: <1320299645-9105-1-git-send-email-gerg@snapgear.com> <1320299645-9105-2-git-send-email-gerg@snapgear.com> <alpine.LNX.2.00.1111031735050.2899@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:58389 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752190Ab1KCGxY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 02:53:24 -0400
In-Reply-To: <alpine.LNX.2.00.1111031735050.2899@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>


On Thu, 3 Nov 2011, I wrote:

> Is it actually possible to run the same kernel binary on CF and 680x0? If 
> not, shouldn't these run-time tests be compile-time #ifdefs?

Oops, I forgot about the compiler's optimiser...

Finn
