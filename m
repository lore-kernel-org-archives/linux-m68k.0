From: <gerg@snapgear.com>
Subject: [PATCH 0/3] m68knommu: some ColdFire interrupt improvements
Date: Wed, 9 Mar 2011 10:51:33 +1000
Message-ID: <1299631896-31186-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:42177 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756918Ab1CIAzH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 19:55:07 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The following 3 patches are just some cleanups to the ColdFire interrupt
controllers in more modern ColdFire CPUs. The resulting asm is slightly
smaller for the mask() and unmask() operations. Oh, and they will be a
little more friendly in only taking the interrupts they service.

--
 b/arch/m68knommu/platform/coldfire/intc-2.c    |   58 ++++++++++---------------
 b/arch/m68knommu/platform/coldfire/intc-simr.c |   47 ++++++++++----------
 2 files changed, 81 insertions(+), 71 deletions(-)
