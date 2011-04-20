From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu
	versions of muldi3
Date: Wed, 20 Apr 2011 10:57:02 +0200
Message-ID: <20110420085702.GA3296@frolo.macqel>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com> <1303278880-16153-3-git-send-email-gerg@snapgear.com> <20110420080609.GA24244@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay008.isp.belgacom.be ([195.238.6.174]:64394 "EHLO
	mailrelay008.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752707Ab1DTI5Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 20 Apr 2011 04:57:16 -0400
Content-Disposition: inline
In-Reply-To: <20110420080609.GA24244@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Apr 20, 2011 at 10:06:09AM +0200, Sam Ravnborg wrote:
> Hi Greg.
> 
> > +
> > +#if defined(__mc68020__) || defined(__mc68030__) || \
> > +    defined(__mc68040__) || defined(__mc68060__)
> 
> Why use these to decide if this is MMU or not?
> This code is not exposed to user-space so we can rely on CONFIG_* symbols.
> IMO the CONIFG_* symbols is easier to read/maintain.

This does not decide about MMU or not MMU, but about the availability
of some assembler instructions in the processor.

Philippe
