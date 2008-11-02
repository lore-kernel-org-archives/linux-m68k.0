From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sat, 1 Nov 2008 22:23:23 -0700
Message-ID: <20081102052323.GA32207@cynthia.pants.nu>
References: <12255325912043-git-send-email-Laurent@lvivier.info> <20081101181013.GA25819@cynthia.pants.nu> <Pine.LNX.4.64.0811021103400.26989@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:57781 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751539AbYKBFYT (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 2 Nov 2008 01:24:19 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0811021103400.26989@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Laurent@lvivier.info, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Sun, Nov 02, 2008 at 11:29:54AM +1100, Finn Thain wrote:
> I think that unless we can probe for the SWIM chip, we should put this 
> information in arch/m68k/mac/config.c. A floppy_type member could be added 
> to struct mac_model to clean up the init code here. That init code could 
> then simply test macintosh_config like all the other drivers that can't or 
> don't probe.

I didn't think about it when I commented earlier, but I agree with this
suggestion. I think there are 5 types we need to put in the table:

MAC_FLOPPY_IWM
MAC_FLOPPY_SWIM_ADDR1
MAC_FLOPPY_SWIM_ADDR2
MAC_FLOPPY_SWIM_IOP
MAC_FLOPPY_AV

We don't have to use this exact naming, but this is the basic categories,
and this driver should handle number 2 and 3 (and maybe 1).

	Brad Boyer
	flar@allandria.com

