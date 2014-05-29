From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: rcu alignment warning tripping on m68k
Date: Thu, 29 May 2014 14:11:51 +0100
Message-ID: <20140529141151.21ed6f95@alan.etchedpixels.co.uk>
References: <538696A0.5090601@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:45238 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756143AbaE2NMC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 May 2014 09:12:02 -0400
In-Reply-To: <538696A0.5090601@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, 29 May 2014 12:08:32 +1000
Greg Ungerer <gerg@uclinux.org> wrote:

> Hi All,
> 
> Inside kernel/rcy/tree.c in __call_rcu() it does an alignment check on
> the head pointer passed in. This trips on m68k systems, because they only
> need alignment of 32bit quantities to 16bit boundaries.

__alignof perhaps ?

or just an ARCH_ define ?
