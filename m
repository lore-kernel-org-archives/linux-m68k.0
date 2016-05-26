From: "George Spelvin" <linux@horizon.com>
Subject: [PATCH v2 00/10] String hash improvements
Date: 26 May 2016 13:09:58 -0400
Message-ID: <20160526170958.23840.qmail__40971.1591354155$1464361084$gmane$org@ns.sciencehorizons.net>
References: <20160525072027.5107.qmail@ns.sciencehorizons.net>
Reply-To: linux@sciencehorizons.net
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:33971 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1752237AbcE0O54 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 May 2016 10:57:56 -0400
In-Reply-To: <20160525072027.5107.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: alistair.francis@xilinx.com, bfields@fieldses.org, geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, michal.simek@xilinx.com, phdm@macq.eu, schwab@linux-m68k.org, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp

This is just the arch-specific part, updated as per requests.

* Fix the stupidly overcomplex m68k conditionals (per Geert Uytterhoeven)
* Renamed the arch file to <asm/hash.h> (per Geert Uytterhoeven)
* Improved the comments on the progress of shift-and-add (Philippe De Muyter)
* Added a self-test (per Michal Simek)

Things I did *not* do, because I thought the concerns were withdrawn
after discussion:  (If I misintrepreted silence, please correct me!)

* Use unconditional inclusion with an <asm-generic/hash.h> fallback.
* Change the multi-line asm() formatting (Philippe De Muyter)
* Move reference about algorithm credit (Philippe De Muyter)

The big change is the addition of a self-test in lib/test_hash.c.
That had to be written and the various tests validated by introducing
deliberate bugs into <arch/hash.h>.

Handling the fact that architectures are allowed to change the computed
function (even though none of the ones written so far have used that
freedom) added some complexity.  I ended up using the value of the
HAVE_ARCH_* macro.  If it's 1, that means it's expected to be a clone
of the generic versions, and it's compared against them.  If it's 0,
it's its own magic thing.

The big question is, should these go through the arch trees, or may I
just include them in the series to Linus?  The latter is simpler for me,
but obviously not okay without permission.
