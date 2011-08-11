From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: merge the mmu and non-mmu
	kernel/Makefiles
Date: Thu, 11 Aug 2011 08:08:07 +0200
Message-ID: <20110811060807.GB21757@merkur.ravnborg.org>
References: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:58968 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab1HKGIJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 11 Aug 2011 02:08:09 -0400
Content-Disposition: inline
In-Reply-To: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Aug 11, 2011 at 02:47:24PM +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
> 
> [This is a resend of this patch. If no-one has any objections then I
> want to push this into linux-next, for eventual inclusion in the 3.2
> merge window.]
> 
> The few differences between the mmu and non-mmu kernel/Makefiles can
> easily be handled inside of a single Makefile. Merge the 2 back into
> a single Makefile.

Looks good (except the typo that is nto a typo:-) )
Acked-by: Sam Ravnborg <sam@ravnborg.org>
