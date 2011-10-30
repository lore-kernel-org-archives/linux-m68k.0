From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 23/36] m68k: ColdFire V4e MMU paginit init code and miss
 handler
Date: Mon, 31 Oct 2011 02:56:28 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1110310144070.2638@nippy.intranet>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com> <1319527168-11166-24-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:57227 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934181Ab1J3P4c (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 11:56:32 -0400
In-Reply-To: <1319527168-11166-24-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>


On Tue, 25 Oct 2011, gerg@snapgear.com wrote:

> From: Greg Ungerer <gerg@uclinux.org>
> 
> The quite different ColdFire V4e MMU requires its own dedicated pageing

s/pageing/paging/

Finn

> init code, and a TLB miss handler for its software driven TLB.
