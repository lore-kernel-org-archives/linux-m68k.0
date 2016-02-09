From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: [PATCH] m68k: use conventional function parameters for
	do_sigreturn
Date: Tue, 9 Feb 2016 16:26:03 +0100
Message-ID: <20160209152603.GA31805@frolo.macqel>
References: <56AFF16E.2020506@uclinux.org> <871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org> <871t8mkcd1.fsf@linux-m68k.org> <56B93106.4050806@uclinux.org> <mvmegcmw6y1.fsf@hawking.suse.de> <56B9E435.2000203@uclinux.org> <mvm37t2uior.fsf@hawking.suse.de> <20160209140101.GA18058@frolo.macqel> <mvmh9hit0gx.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([109.135.2.61]:60093 "EHLO smtp2.macqel.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756103AbcBIP0I (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 9 Feb 2016 10:26:08 -0500
Content-Disposition: inline
In-Reply-To: <mvmh9hit0gx.fsf@hawking.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

On Tue, Feb 09, 2016 at 03:36:14PM +0100, Andreas Schwab wrote:
> Philippe De Muyter <phdm@macq.eu> writes:
> 
> > Given what gcc does now, how can scanf still work then ?
> 
> In which way is that related to scanf?

The scanf family uses/used varargs to determine the addresses of the
returned values to fill, like do_sigreturn.

But I see the difference now : with scanf only the addresses are on the
stack, while with do_sigreturn the values themselves are on the stack.

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
