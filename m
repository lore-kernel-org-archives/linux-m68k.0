From: <gerg@snapgear.com>
Subject: [PATCH 0/4] m68knommu: add support for ColdFire 5373 CPU family
Date: Mon, 19 Nov 2012 15:14:04 +1000
Message-ID: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mivwsmailout1.mcafee.com ([161.69.47.167]:27396 "EHLO
	MIVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395Ab2KSFOp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Nov 2012 00:14:45 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The following patches add support for the ColdFire 5373 CPU family.
At this stage it is very much an RFC really, I don't have any 5373 hardware
to even test it on.

It is based on ideas taken from Gachet Daniel's patch set that added support
for the M5373EVB. But these patches are quite different. I could see from
his changes that the 5373 CPU family is very similar to the 532x family.
So these patches morph the current 532x CPU family support to be able to
also support the 5373 family.

Would be really great if someone could actually test that these work.
