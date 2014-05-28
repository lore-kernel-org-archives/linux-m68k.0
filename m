From: gerg@uclinux.org
Subject: [PATCH 0/9] m68knommu: use ColdFire DMA timer
Date: Wed, 28 May 2014 10:49:40 +1000
Message-ID: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas01p.mx.bigpond.com ([61.9.168.137]:50496 "EHLO
	nskntmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751386AbaE1Atz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:55 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Most of the modern ColdFire family members contain the DMA timer hardware
module. Build the support code for it and use it on those that do. We can
use it as an accurate time source.

I don't have test platforms based on all of these ColdFire types, it would
be really helpful if anyone that has any of these can test these changes.
It build tests fine on all these types, and it works on 520x and 527x
based platforms.

These changes are (neccessarily) on top of my recent patch series titled
"clean up timer code on the ColdFire 53xx".

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h        |    8 ++++++++
 arch/m68k/include/asm/m523xsim.h        |    8 ++++++++
 arch/m68k/include/asm/m527xsim.h        |    8 ++++++++
 arch/m68k/include/asm/m528xsim.h        |    8 ++++++++
 arch/m68k/include/asm/m53xxsim.h        |   10 +++++-----
 arch/m68k/include/asm/m5441xsim.h       |    8 ++++++++
 arch/m68k/platform/coldfire/Makefile    |   10 +++++-----
 arch/m68k/platform/coldfire/dma_timer.c |   24 +++++++++++++-----------
 8 files changed, 63 insertions(+), 21 deletions(-)
