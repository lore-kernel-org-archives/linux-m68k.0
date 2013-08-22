From: "Joseph S. Myers" <joseph@codesourcery.com>
Subject: Re: TLS, was Re: Getting the ol' Macintosh LC475 modernized
Date: Thu, 22 Aug 2013 13:37:18 +0000
Message-ID: <Pine.LNX.4.64.1308221334330.2618@digraph.polyomino.org.uk>
References: <52116B54.8080507@iamscott.net> <Pine.BSM.4.64L.1308190104230.780@herc.mirbsd.org>
 <5212C061.9040306@iamscott.net> <Pine.BSM.4.64L.1308200654590.2366@herc.mirbsd.org>
 <52143FE6.9050805@iamscott.net> <alpine.LNX.2.00.1308211423540.885@nippy.intranet>
 <Pine.BSM.4.64L.1308210819340.10692@herc.mirbsd.org>
 <CAMuHMdV4dns1-B6C9gx2oqX-umrVzJLQmvgJu+h163KOjJxRCA@mail.gmail.com>
 <Pine.BSM.4.64L.1308212250320.16289@herc.mirbsd.org>
 <alpine.LNX.2.00.1308221034260.3643@nippy.intranet>
 <Pine.LNX.4.64.1308221142180.31459@digraph.polyomino.org.uk>
 <CAMuHMdW+zp1=3Jpg2FVDEFD+B58iAO=8ibL=45rgsgy32S43ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:58432 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752352Ab3HVNhY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Aug 2013 09:37:24 -0400
In-Reply-To: <CAMuHMdW+zp1=3Jpg2FVDEFD+B58iAO=8ibL=45rgsgy32S43ZQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, 22 Aug 2013, Geert Uytterhoeven wrote:

> > The vDSO support has been there in glibc ever since the NPTL port was
> > first added.  I've no idea why the kernel changes still haven't gone in.
> 
> I didn't know that. Seems to be recent work, cfr.
> https://github.com/Xilinx/glibc/blob/master/ports/ChangeLog.m68k ?

It dates back to the original 2010-03-09 addition of NPTL support.

> Where can I find the kernel changes?

I don't know where such changes may have originally been posted but e.g. 
one version appears to be at 
<https://dev.openwrt.org/browser/trunk/target/linux/coldfire/patches/012-Add-vDSO-support-for-Coldfire-platform.patch?rev=31546>.

-- 
Joseph S. Myers
joseph@codesourcery.com
