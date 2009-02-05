From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: Fix support for console port other than ttyS0 on mcf.c
Date: Thu, 5 Feb 2009 10:57:00 -0500
Message-ID: <20090205155700.GO26064@csclub.uwaterloo.ca>
References: <20090204201518.GH26064@csclub.uwaterloo.ca> <20090204202009.GI26064@csclub.uwaterloo.ca> <Pine.LNX.4.64.0902042200340.25136@anakin> <20090205152751.GL26064@csclub.uwaterloo.ca> <Pine.LNX.4.64.0902051652080.5127@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from caffeine.csclub.uwaterloo.ca ([129.97.134.17]:55846 "EHLO
	caffeine.csclub.uwaterloo.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751890AbZBEP5D (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Feb 2009 10:57:03 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0902051652080.5127@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-m68k@vger.kernel.org, uClinux list <uclinux-dev@uclinux.org>

On Thu, Feb 05, 2009 at 04:53:50PM +0100, Geert Uytterhoeven wrote:
> linux-m68k@lists.linux-m68k.org handles m68k (with MMU) only.
> uclinux-dev@uclinux.org handles m68knommu.

Oh.  I think I got confused by the fact the same arch/m68k/include is
used for both. so I looked up m68k in MAINTAINERS.

I will start bothering uclinux-dev@uclinux.org instead.

So by uclinux driver you meant m68knommu uclinux driver.  I was thinking
uclibc for some reason.

-- 
Len Sorensen
