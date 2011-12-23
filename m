From: <gerg@snapgear.com>
Subject: [PATCH 00/35 v4] m68k: ColdFire MMU support
Date: Fri, 23 Dec 2011 13:15:13 +1000
Message-ID: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:22237 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754168Ab1LWDOa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:30 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Hi All,

This is version 4 of a patch set that adds support for running the V4e
ColdFire cores with their MMU enabled. Just more little cleanups over
version 3. Changes include:

. rebased onto 3.2-rc6
. modified ioremap bit changes
. properly "extern"ed the _ram_* variables
. cleaned up include list in mcfmmu.c
. cleaned up the ZONE_* memory setup
. some checkpatch cleanups

This patch set is based on 3.2-rc6 with all the recent patches I have sent
here applied first. It is available as a git tree for easier testing, just
pull this tree, with the cfmmu branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cfmmu

I have pulled these changes into the for-next branch on this tree too.
So they will get some linux-next testing from now on as well.

All m68k defconfigs compile. Run tested on FireBee/5475, M5208EVB and under
AranyM.

Regards
Greg
