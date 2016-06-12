From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Issues with vmalloc and ebtables on ColdFire V4e
Date: Sun, 12 Jun 2016 12:44:02 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1606121226130.32749@nippy.intranet>
References: <loom.20160611T070345-553@post.gmane.org> <fbca48b5-7a46-c583-7457-372d865e6684@physik.fu-berlin.de> <9b4733d6-fe6d-a27b-aa59-c3285b1fb917@rallycraft.com> <575C0ECB.3050600@linux-m68k.org> <8b213da6-fbfe-f55e-b5c1-b6a2a0ee87c4@rallycraft.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54083 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbcFLCoT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Jun 2016 22:44:19 -0400
In-Reply-To: <8b213da6-fbfe-f55e-b5c1-b6a2a0ee87c4@rallycraft.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Reid Lindsay <reidlindsay@rallycraft.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-m68k@vger.kernel.org


On Sun, 12 Jun 2016, Reid Lindsay wrote:

> 
> Incidentally, our board has been stable since 2012, this issue only came 
> to light once ebtables was enabled.

If the issue were to be reproduced using a 680x0 emulator like Aranym (and 
maybe the Debian compiler) one might suspect some code in ebtables is 
assuming natural alignment of integers...
$ grep -i align net/bridge/netfilter/ebt*

-- 
