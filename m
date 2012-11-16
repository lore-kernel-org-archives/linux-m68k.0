From: <gerg@snapgear.com>
Subject: [PATCH 00/12] m68knommu: generalize the ColdFire clock support for all CPU types
Date: Fri, 16 Nov 2012 14:47:24 +1000
Message-ID: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45208 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750816Ab2KPElW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Nov 2012 23:41:22 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The current Coldfire clock code only really supports those ColdFire CPU types
that have the more advanced enable/disable clock hardware support. If we
generalize our clock code we can support all types, even those with simpler
fixed clock trees.

This results in much cleaner and consistent clock support. And it means that
we can in the future use the clock API in our timers and throughout the other
ColdFire p[eripheraps, instead of hard coded clock definitions.
