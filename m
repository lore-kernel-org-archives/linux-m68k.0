From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pull] m68knommu arch updates
Date: Wed, 9 Dec 2009 19:13:25 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0912091910340.3560@localhost.localdomain>
References: <200912090758.nB97wPok013748@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:48643 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758697AbZLJDNm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Dec 2009 22:13:42 -0500
In-Reply-To: <200912090758.nB97wPok013748@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@uclinux.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-m68k@vger.kernel.org



On Wed, 9 Dec 2009, Greg Ungerer wrote:
> 
> Please pull to get the latest m68knommu arch fixes. Not a lot in here,
> mostly small fixes. The biggest change is Tim Abbott's linker script
> cleanups.

Hmm. I got a conflict due to the other m68k changes on the file 
arch/m68k/include/asm/ptrace.h.

I fixed it up the way that seemed most appropriate, but somebody should 
double-check. My resolution is not identical to either source branch tree.

		Linus
