Return-Path: <SRS0=yKKv=A5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921CDC433E1
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CD1720734
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595089619;
	bh=BMMiV2wlG2kV6/EmY1ekc65/5mki+g1eGZSiXZFI3aU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=i/X+OtuWr3UIt0UBiv02wz2G4EXLmwewvjGn56Cx2B3baKs+7/92bKVB8GZERb4EX
	 qith/hR0MifAe3imHEWoiDUk6t6I6iwkmFck24FXxOZBruP2LA6uB2x18UqbrvULUO
	 UDWFr1YS3RcCh50c+dAYMWUhUHinjMZL88/tKItA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGRQ07 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 18 Jul 2020 12:26:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgGRQ07 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 18 Jul 2020 12:26:59 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D05BC20724;
        Sat, 18 Jul 2020 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595089618;
        bh=BMMiV2wlG2kV6/EmY1ekc65/5mki+g1eGZSiXZFI3aU=;
        h=From:To:Cc:Subject:Date:From;
        b=KqOaVEk1kmiGJbB5E3H4XXSPdDGVPYsxGLhEo+viO6pAvDMnkfltsayPjS2PRPF5T
         ImFq8uSc1NwtST97SsZ73VeNpMOcdMkzt9HJkDkMQCtQe1gzI38DoZBhawGnDYP/+6
         O0DpSYO8aKSMKIeWTUHAXuQGCtMkCHFUFdBIFYFY=
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
Date:   Sat, 18 Jul 2020 19:26:48 +0300
Message-Id: <20200718162651.26538-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

It took me a while to get back to this, but better late than never :)

These patches replace DISCONTIGMEM with SPARSEMEM on m68k for systems with
!SINGLE_MEMORY_CHUNK set.

With SPARSEMEM there is a single node for the entire physical memory and to
cope with holes in the physical address space it is divided to sections of
several megabytes.

Each section has it's own memory map which size depends on actual populated
memory.

The section size of 16M was chosen pretty much arbitrarily as I couldn't
find specs for systems with e.g. Zorro memory extensions. 
Yet, we cannot use smaller sections and still be able to address the entire
4G of the physical memory because the section number is encoded in the page
flags and there are only 8 bits available.

For systems with several small memory chunks and with small (several megs)
holes between them, 16M section size would cause wasted parts in the memory
map and it is desirable to allow smaller section size at the expense of
limiting the addressable memory.

I've hesitated between adding Kconfig option as Finn suggested [1] and
other options like SPARSE_VMEMMAP or ARCH_HAS_HOLES_MEMORYMODEL. In the
end, I think Kconfig is the simplest one from the implementation point of
view and would work fine for people that run mainline kernels on vintage
hardware.

For the systems with ST-RAM and FastRAM, the switch to SPARSEMEM does not
change the limitation that if the kernel is loaded into the FastRam the
ST-RAM remains unmapped. It only ensures that if the kernel is loaded in
ST-RAM, the memory map is allocated from high physical addresses and then
atari/stram.c is able to reserve the frame buffer memory. If the kernel is
loaded to FastRAM, the ST-RAM remains unmapped as with DISCONTIGMEM and the
atari/stram.c maps it as IOMEM.

[1] https://marc.info/?l=linux-m68k&m=156309170500921&w=2

v3 changes:
* rebase on the current upstream
* alias ARCH_PFN_BASE to m68k_memory[0].addr
* add configuration option to allow two variants of section size.

v2 changes:
* rebase on the current upstream
* make ColdFire MMU select SINGLE_MEMORY_CHUNK in Kconfig.cpu

Mike Rapoport (3):
  m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
  m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
  m68k/mm: switch from DISCONTIGMEM to SPARSEMEM

 arch/m68k/Kconfig.cpu               | 14 ++++++--
 arch/m68k/include/asm/page.h        |  2 ++
 arch/m68k/include/asm/page_mm.h     |  6 +++-
 arch/m68k/include/asm/sparsemem.h   |  8 +++++
 arch/m68k/include/asm/virtconvert.h |  2 +-
 arch/m68k/mm/init.c                 |  8 ++---
 arch/m68k/mm/motorola.c             | 64 ++++++++++++++++++++++++++++++-------
 7 files changed, 84 insertions(+), 20 deletions(-)
 create mode 100644 arch/m68k/include/asm/sparsemem.h

-- 
2.7.4


*** BLURB HERE ***

Mike Rapoport (3):
  m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
  m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
  m68k/mm: switch from DISCONTIGMEM to SPARSEMEM

 arch/m68k/Kconfig.cpu               | 23 ++++++++++++++---
 arch/m68k/include/asm/page.h        |  2 ++
 arch/m68k/include/asm/page_mm.h     |  7 +++++-
 arch/m68k/include/asm/virtconvert.h |  2 +-
 arch/m68k/mm/init.c                 |  8 +++---
 arch/m68k/mm/motorola.c             | 39 ++++++++++++++++++++++++++---
 6 files changed, 69 insertions(+), 12 deletions(-)

-- 
2.26.2

