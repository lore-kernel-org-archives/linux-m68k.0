From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 00/12] scsi/NCR5380: fix debugging macros and #include
 structure
Date: Tue, 18 Mar 2014 23:00:12 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403182208590.2018@nippy.intranet>
References: <20140318002822.372705594@telegraphics.com.au> <1395112756.20860.1.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:60107 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753659AbaCRMAk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Mar 2014 08:00:40 -0400
In-Reply-To: <1395112756.20860.1.camel@joe-AO722>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, Sam Creasey <sammy@sammy.net>, Russell King <linux@arm.linux.org.uk>, Michael Schmitz <schmitz@debian.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@vger.kernel.org


On Mon, 17 Mar 2014, Joe Perches wrote:

> 
> My preference would be to change dprintk to scsi_dbg

Can you be more specific? I gather you're not referring to the debugging 
routines in include/scsi/scsi_dbg.h as they aren't equivalent.

Is it the name "dprintk" you object to?

I went looking in drivers/scsi/ for some kind of naming convention for a 
conditional printk. There are some other variations on the theme (DEBUG, 
PDEBUG, PERROR, etc) but dprintk() seems to be the most popular.

-- 
