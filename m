From: "George Spelvin" <linux@horizon.com>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: 13 May 2016 05:02:10 -0400
Message-ID: <20160513090210.15223.qmail@ns.horizon.com>
References: <57357809.1000308@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:44158 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751089AbcEMJCN (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 13 May 2016 05:02:13 -0400
In-Reply-To: <57357809.1000308@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux@horizon.com

>> I'll write it for you if you like.
> I was hoping you would write the code :-)

And then you beat it to me anyway.

> So is something like this what you had in mind?

I would probably have done it slightly differently,
but basically yes.

> That runs with no fails in qemu and on real ColdFire hardware.

Yay!  Thank you very much.

> I guess it wouldn't hurt to specifically check the corner cases
> either (at MAX_INT, MIN_INT and 0 for example).

Not really necessary, as those aren't special-cased in the code
in any way.  An error would be multiplying the wrong parts of
the inputs or summing the partial products wrong.

Which, like most math and crypto code, would result in immediate
massive errors.  Just a handful of test cases is enough.

(Typical code coverage tests want to hit every execution path,
meaning both sides of every conditional branch.  Since this is
straight-line code, it's very easy to test.)

FWIW, I've severly rethought that second patch, but don't have time
to write it up in the detail it needs just now.
