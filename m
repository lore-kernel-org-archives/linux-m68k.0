From: <gerg@snapgear.com>
Subject: [PATCH 0/2] m68k/net: add support for NS8390 based eth controllers on some ColdFire boards
Date: Mon, 25 Jun 2012 11:29:50 +1000
Message-ID: <1340587792-8596-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:38673 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752030Ab2FYBaT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Jun 2012 21:30:19 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


I have broken up the NS8390 support for ColdFire boards into 2 patches.
The first is the net support side of it, and the other is the ColdFire
platform support.

If no-one has any comments then I'll send the first patch onto the net list
for review. I'll add the second platform patch to the m68knommu git tree
for-next branch.
