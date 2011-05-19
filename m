From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [uClinux-dev] [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Thu, 19 May 2011 10:52:32 +0200
Message-ID: <20110519085232.GA27058@frolo.macqel>
References: <1305696747-29641-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay001.isp.belgacom.be ([195.238.6.51]:26980 "EHLO
	mailrelay001.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756833Ab1ESIwh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 19 May 2011 04:52:37 -0400
Content-Disposition: inline
In-Reply-To: <1305696747-29641-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, May 18, 2011 at 03:32:27PM +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
> 
> The following patch merges the mmu and non-mmu versions of the m68k
> bitops.h files. Now there is a good deal of difference between the two
> files, but none of it is actually an mmu specific difference. It is
> all about the specific m68k/coldfire varient we are targeting. So it
> makes an awful lot of sense to merge these into a single bitops.h.

Thanks for taking care of that.  Fork was easy (but ugly), but merge
is a tedious job.

Philippe
