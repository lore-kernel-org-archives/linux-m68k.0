From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 14/22] ncr5380: Add MAX_LUN limit
Date: Tue, 15 Mar 2016 01:26:35 -0700
Message-ID: <20160315082635.GA917@infradead.org>
References: <20160314042700.596192247@telegraphics.com.au>
 <20160314042704.285983735@telegraphics.com.au>
 <20160314075112.GA19372@infradead.org>
 <alpine.LNX.2.00.1603151341080.9662@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:37126 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S932842AbcCOI1k (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 15 Mar 2016 04:27:40 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1603151341080.9662@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>, Sam Creasey <sammy@sammy.net>

On Tue, Mar 15, 2016 at 02:20:55PM +1100, Finn Thain wrote:
> I don't think the host template is the right place for this (there are 
> about ten of these that would need to be changed anyway) because 
> scsi_host_alloc() assigns shost->max_lun = 8. So I'll add the 
> instance->max_lun = 7 assignment to NCR5380_init().

Ok.
