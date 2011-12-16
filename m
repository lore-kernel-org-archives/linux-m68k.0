From: <gerg@snapgear.com>
Subject: [PATCH 00/35 v3] m68k: ColdFire MMU support
Date: Fri, 16 Dec 2011 22:35:57 +1000
Message-ID: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49347 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756594Ab1LPMgc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:36:32 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Hi All,

This is version 3 of a patch set that adds support for running the V4e
ColdFire cores with their MMU enabled. Not a whole lot of change from
version 2. Changes include:

. rebased onto 3.2-rc5
. additional acked-by's 
. change of TASK_MAPPED_BASE (as per advice from Jin Zhengxiong)
. make kmap and vmalloc areas bigger

This patch set is based on 3.2-rc5 with all the recent patches I have sent
here applied first. It is available as a git tree for easier testing, just
pull this tree, with the cfmmu branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cfmmu

Some of the code in this set is taken from Freescales 2.6.25 kernel support
of MMU ColdFire. I have contacted Kurt Mahan and Matt Wadell (two of the
people from Freescale who originally worked on this) and they have had a
look over it. I have also let Freescale know about this current work.

If there is no out-standing concerns with this I would like to throw it
into linux-next to get some testing there.

Regards
Greg
