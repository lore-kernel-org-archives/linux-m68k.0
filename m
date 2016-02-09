From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: [PATCH] m68k: use conventional function parameters for
	do_sigreturn
Date: Tue, 9 Feb 2016 15:01:01 +0100
Message-ID: <20160209140101.GA18058@frolo.macqel>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org> <8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org> <871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org> <871t8mkcd1.fsf@linux-m68k.org> <56B93106.4050806@uclinux.org> <mvmegcmw6y1.fsf@hawking.suse.de> <56B9E435.2000203@uclinux.org> <mvm37t2uior.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([109.135.2.61]:54460 "EHLO smtp2.macqel.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754143AbcBIOKD (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 9 Feb 2016 09:10:03 -0500
Content-Disposition: inline
In-Reply-To: <mvm37t2uior.fsf@hawking.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

On Tue, Feb 09, 2016 at 02:17:24PM +0100, Andreas Schwab wrote:
> Greg Ungerer <gerg@uclinux.org> writes:
> 
> > Given the original code is:
> >
> >   asmlinkage int do_sigreturn(unsigned long __unused)
> >   {
> >         struct switch_stack *sw = (struct switch_stack *) &__unused;
> >         struct pt_regs *regs = (struct pt_regs *) (sw + 1);
> >
> > So gcc is determining that what sw and regs points to are
> > part of do_sigreturn() parameters here?
> 
> It's basically what varags used to do.

Given what gcc does now, how can scanf still work then ?

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
