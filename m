From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] reinstate mac rtc
Date: Wed, 15 Oct 2008 23:49:19 -0700
Message-ID: <20081016064919.GB28644@cynthia.pants.nu>
References: <F86D8C33-9B01-11DD-B097-00050249ADE1@kaffe.org> <Pine.LNX.4.64.0810161144240.6252@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:45902 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1750992AbYJPGuP (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 16 Oct 2008 02:50:15 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0810161144240.6252@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Riccardo <riccardo@kaffe.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

On Thu, Oct 16, 2008 at 12:02:59PM +1100, Finn Thain wrote:
> I don't know what is wrong with the clock on the Q950. Mine uses ntp. Are 
> you sure it works with 2.2?

I'm very sure that we never had a working RTC on the Q900/Q950. In fact,
I believe that trying it crashed the system in 2.2. The kernel tried to
use one of the existing RTC routines on that hardware when it wasn't
the right thing to do. In particular it used the VIA bit-poking method
that really old macs need and that wasn't a good thing.

The caboose chip handles the RTC on these systems (and a few other
things as well) and we just simply don't know how to use it.

	Brad Boyer
	flar@allandria.com

