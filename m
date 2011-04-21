From: <gerg@snapgear.com>
Subject: [PATCH 0/5] m68k: merge and clean up of arch/m68k/kernel/m68k_ksyms*.c files
Date: Thu, 21 Apr 2011 10:48:05 +1000
Message-ID: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:19380 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752420Ab1DUAtb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:49:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The following patch series prepares for, and does, merging of the mmu
and non-mmu versions of m68k_ksyms.c. Most of it is really a cleanup
of the m68knommu symbol exporting. In the end the merge of the
m68k_ksyms_mm.c and m68k_ksyms_no.c is pretty simple.

Build and run tested on ARAnyM and ColdFire targets.
