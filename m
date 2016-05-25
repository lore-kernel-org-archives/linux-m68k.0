From: "George Spelvin" <linux@sciencehorizons.net>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: 25 May 2016 09:42:05 -0400
Message-ID: <20160525134205.21112.qmail@ns.sciencehorizons.net>
References: <20160525132406.GA13750@frolo.macqel>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:46442 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1751634AbcEYNmI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 May 2016 09:42:08 -0400
In-Reply-To: <20160525132406.GA13750@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux@sciencehorizons.net, phdm@macq.eu
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de, torvalds@linux-foundation.org

Philippe De Muyter wrote:
> On Wed, May 25, 2016 at 03:34:55AM -0400, George Spelvin wrote:
>> Addition chains found by Yevgen Voronenko's Hcub algorithm at
>> http://spiral.ece.cmu.edu/mcm/gen.html

> Shouldn't you put that reference in the comments of your archhash.h file ?

I don't really care either way, but generally comments show what the
code does and commit messages talk about how it was created and by whom.
That references seemed to fall into the latter category.

Rationales (*why* it does what it does) can go in both places, with the
commit message providing more room.


I have a revised set of arch/ patches including all of the suggestions
made so far, currently awaiting the requested self-test.

(I found a clean way to do it using the *value* of the HAVE_FOO define
to indicate whether the function is meant to be equivalent to the
generic one.  If it's 1, the self-test will compare the arch-specific
and generic implementations.)
