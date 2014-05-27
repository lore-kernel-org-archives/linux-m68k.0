From: gerg@uclinux.org
Subject: [PATCH 0/2] m68knommu: clean up timer code on the ColdFire 53xx
Date: Tue, 27 May 2014 16:28:20 +1000
Message-ID: <1401172102-1599-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv02p.mx.bigpond.com ([61.9.168.234]:35902 "EHLO
	nskntqsrv02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751932AbaE0GmD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 02:42:03 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The timer code used on the ColdFire 53xx series is abusing the old 16bit
timer code. The hardware module it uses is really the more modern DMA
timer hardware module. It bends the reads/writes and modifies some addresses
so that it basically works.

It would be much better to use the modern Programmable Interrupt Timer
hardware module that these SoC contain. This PIT timer is used on all
the other modern ColdFire family members.

We also have DMA timer code that we will in the future use as a more
accurate clock source and cycle counter. So the idea here is to clean up
this usage to free up the timer hardware.

I don't have any 53xx based hardware, so I have not been able to run time
test this. If anyone can test this and confirm that it works as expected
that would be great.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu                |    2 ++
 arch/m68k/include/asm/m53xxsim.h     |   19 ++++++++++---------
 arch/m68k/include/asm/mcftimer.h     |    4 ----
 arch/m68k/platform/coldfire/Makefile |    2 +-
 arch/m68k/platform/coldfire/timers.c |   16 ++--------------
 5 files changed, 15 insertions(+), 28 deletions(-)
