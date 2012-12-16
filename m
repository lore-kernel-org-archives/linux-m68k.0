From: Mikael Pettersson <mikpe@it.uu.se>
Subject: possible breakage with the >= 020 bfset et al bitops
Date: Sun, 16 Dec 2012 16:05:37 +0100
Message-ID: <20685.58177.575315.650990@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.uu.se ([130.238.7.54]:41750 "EHLO smtp1.uu.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752253Ab2LPPML (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 16 Dec 2012 10:12:11 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Mikael Pettersson <mikpe@it.uu.se>

I've recently found and fixed a bug in e2fsprogs on m68k-linux,
caused by it implementing bitops with bfset et al, and then using
large (>= 2G) unsigned bit numbers even though such numbers are
interpreted as negative by the bit field instructions, resulting
in accesses way below the bitmap being operated upon.

A quick glance in the kernel shows that its bitops for >= 020 may
have the same problem.

So,

Q1: Are the kernel's bitops guaranteed to never be applied to
bitmaps larger than 256MB (2Gbit)?  ARAnym can certainly boot
kernels with much more memory than that, so I suspect the answer
is "no".

Q2: Assuming a "no" answer to Q1, what do we want to do about it?
a) declare it a user (driver, whatever) error and ignore it?
b) add a BUG_ON(nr < 0); at the start of bfset_mem_set_bit et al?
c) manually adjust the base address and bit number to refer to the
   correct byte before performing the bit field instructions?
   (that is what my e2fsprogs fix does)

With option c) I believe there is no longer any advantage to
bfset et al over the classic bset et al, so some of the code
in arch/m68k/include/asm/bitops.h could possibly be unified.

Side note: in arch/m68k/include/asm/bitops.h, shouldn't the bit
number parameter 'nr' be 'unsigned int' for consistency with
Documentation/atomic_ops.txt?  Surely nothing expects to be able
to use negative bit numbers...?

/Mikael
