From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 09/12] scsi/NCR5380: fix and standardize NDEBUG macros
Date: Wed, 28 May 2014 02:54:23 -0700
Message-ID: <20140528095423.GI26617@infradead.org>
References: <20140318004212.612472697@telegraphics.com.au>
 <20140318004215.292486266@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34571 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441AbaE1JyY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 May 2014 05:54:24 -0400
Content-Disposition: inline
In-Reply-To: <20140318004215.292486266@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, Sam Creasey <sammy@sammy.net>, Russell King <linux@arm.linux.org.uk>, Michael Schmitz <schmitz@debian.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@vger.kernel.org

On Tue, Mar 18, 2014 at 11:42:21AM +1100, Finn Thain wrote:
> All three NCR5380 core driver implementations share the same NCR5380.h
> header file so they need to agree on certain macro definitions.
> 
> The flag bit used by the NDEBUG_MERGING macro in atari_NCR5380 and
> sun3_NCR5380 collides with the bit used by NDEBUG_LISTS.
> 
> Moreover, NDEBUG_ABORT appears in NCR5380.c so it should be defined in
> NCR5380.h rather than in each of the many drivers using that core.
> 
> An undefined NDEBUG_ABORT macro caused compiler errors and led to dodgy
> workarounds in the core driver that can now be removed.
> (See commits f566a576bca09de85bf477fc0ab2c8c96405b77b and
> 185a7a1cd79b9891e3c17abdb103ba1c98d6ca7a.)
> 
> Move all of the NDEBUG_ABORT, NDEBUG_TAGS and NDEBUG_MERGING macro
> definitions into NCR5380.h where all the other NDEBUG macros live.
> 
> Also, incorrect "#ifdef NDEBUG" becomes "#if NDEBUG" to fix the warning:
> drivers/scsi/mac_scsi.c: At top level:
> drivers/scsi/NCR5380.c:418: warning: 'NCR5380_print' defined but not used
> drivers/scsi/NCR5380.c:459: warning: 'NCR5380_print_phase' defined but not used
> 
> The debugging code is now enabled when NDEBUG != 0.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
