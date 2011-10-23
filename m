From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Sun, 23 Oct 2011 11:53:26 +0200
Message-ID: <m2ty70ghk9.fsf@linux-m68k.org>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:48115 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754154Ab1JWJxc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 05:53:32 -0400
In-Reply-To: <alpine.DEB.2.00.1105052042590.17077@ayla.of.borg> (Geert
	Uytterhoeven's message of "Thu, 5 May 2011 20:44:20 +0200 (CEST)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> From 5739b340b334de21c6da4f65d5194957662a6dd0 Mon Sep 17 00:00:00 2001
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Thu, 5 May 2011 20:33:02 +0200
> Subject: [PATCH] m68k: unistd - Comment out definitions for unimplemented syscalls

This is not a good idea at least for the syscalls referenced by glibc.
It means that a glibc compiled against this <asm/unistd.h> will lose the
ability to call those syscalls even if the running kernel happens to
implement them.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
