From: <gerg@snapgear.com>
Subject: [PATCH 0/2] m68knommu: better support for ColdFire external interrupts
Date: Mon, 14 Mar 2011 10:36:17 +1000
Message-ID: <1300062979-3060-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:59865 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab1CNAhw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Mar 2011 20:37:52 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Implement proper setup and support for the external interrupts on the
newer families of ColdFire CPUs. Most of them offer up to 7 external
(that is not on-chip) interrupts, and there is some extra effort required
to init them, and ack them.
