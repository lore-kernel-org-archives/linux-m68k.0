From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug
 console
Date: Mon, 26 May 2014 21:43:53 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405262143160.10801@nippy.intranet>
References: <20140411052757.888960081@telegraphics.com.au> <20140411052759.169790206@telegraphics.com.au> <538301BA.1070605@gmail.com> <CAMuHMdXHWrusZSpfNkT03Q_vgSraoO535Un-Cazxmy6JQxzn6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:52891 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751591AbaEZLpA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 07:45:00 -0400
In-Reply-To: <CAMuHMdXHWrusZSpfNkT03Q_vgSraoO535Un-Cazxmy6JQxzn6Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 26 May 2014, Geert Uytterhoeven wrote:

> On Mon, May 26, 2014 at 10:56 AM, Michael Schmitz <schmitzmic@gmail.com> 
> wrote:
> >> +       /* Wait for 5 PCLK cycles, which is about 63 CPU cycles */
> >> +       /* 5 / 7.9872 MHz = approx. 0.63 us = 63 / 100 MHz */
> >
> > The original Falcon and TT had a 16 MHz CPU clock IIRC.
> 
> This loop is meant to introduce a minimum delay, right? So assuming a 
> 100 MHz CPU will only prolong the delay on slower CPUs, which is safe.

Right. It's intended to cope with CPU upgrades.

-- 
