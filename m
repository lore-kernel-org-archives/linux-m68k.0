From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 0/2] section name cleanup for m68k
Date: Thu, 30 Apr 2009 19:49:21 -0400
Message-ID: <1241135363-8506-1-git-send-email-tabbott@mit.edu>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from BISCAYNE-ONE-STATION.MIT.EDU ([18.7.7.80]:60506 "EHLO
	biscayne-one-station.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1764214AbZD3XyR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 30 Apr 2009 19:54:17 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Tim Abbott <tabbott@mit.edu>

This patch series cleans up the section names on the m68k
architecture.  It requires the architecture-independent macro
definitions from this patch series:

<http://www.spinics.net/lists/mips/msg33499.html>

The long-term goal here is to add support for building the kernel with
-ffunction-sections -fdata-sections.  This requires renaming all the
magic section names in the kernel of the form .text.foo, .data.foo,
.bss.foo, and .rodata.foo to not have collisions with sections
generated for code like:

static int nosave = 0; /* -fdata-sections places in .data.nosave */
static void head(); /* -ffunction-sections places in .text.head */

Note that these patches have not been boot-tested (aside from testing
the analogous changes on x86), since I don't have access to the
appropriate hardware.

	-Tim Abbott


Tim Abbott (2):
  m68k: use new macro for .data.cacheline_aligned section.
  m68k: use new macros for .data.init_task.

 arch/m68k/kernel/process.c        |    4 ++--
 arch/m68k/kernel/vmlinux-std.lds  |    7 ++-----
 arch/m68k/kernel/vmlinux-sun3.lds |    2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)

