Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FE23F431
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526458; cv=none; b=AMPTUiyGrQ1K9Vsk0jxzDZ7mI5acOIkvwP2H4OJK5QQ+ryevnpKqSYHFRolJfT5+FW0Q17Q9d69/Oz8cZOJyhlx8tf5jV2y8xu/BLd+orp/6rE9N96E0dxKBtO7rfInVWM/EXcmlwLf1dMBmYHcUA6Qli72ZCuZV2BfeMHGXAAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526458; c=relaxed/simple;
	bh=OGT6M6eKOupmwItYRmBpWCmhebkeHcOY3kL/IB8YA1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EevnKF+xrDRFU0hVbeVpsWCC97fbqzJq+oE51eGhleXThEOsdg4LnkNzwuQu4UDu/A2FixledZ2uERp0/39WO+88i1sKQCRU5O84C4m1S+xD/b6+LvL1Uz4CILbnb/0gTBel44Rmitzpx8oh34rOGymHujNDXkbqQ/EXL3BSqTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 026FE43BF5;
	Thu, 30 Apr 2026 05:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D13C2BCB8;
	Thu, 30 Apr 2026 05:20:54 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: m68k: coldfire: create internal register access defines
Date: Thu, 30 Apr 2026 15:19:16 +1000
Message-ID: <20260430052047.1827575-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The readx/writex family of IO access functions for ColdFire are
non-standard. They return native endian data for multi-byte access,
which on m68k/ColdFire is big-endian byte order. A number of places
need fixing to change readx/writex to be more standard - a lot of
the CPU/SoC architecture specific code and a number of drivers.

The existing ColdFire CPU/SoC architecture code is inconsistent in
how it accesses SoC hardware module registers. Both readx/writex
and __raw_readx/__raw_writex are used across the code base. To clean
this up this set of patches moves to an internal set of access
defines for the CPU/SoC architecture code. The following are defined
and used for all internal register access:

    8 bit read  -->  mcf_read8
    8 bit write -->  mcf_write8
   16 bit read  -->  mcf_read16
   16 bit write -->  mcf_write16
   32 bit read  -->  mcf_read32
   32 bit write -->  mcf_write32

To ease review I have broken the changes up a little, grouping major
blocks together instead of one huge patch.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/clk.c        |    8 +-
 arch/m68k/coldfire/device.c     |    8 +-
 arch/m68k/coldfire/dma_timer.c  |   12 +--
 arch/m68k/coldfire/intc-2.c     |   30 ++++-----
 arch/m68k/coldfire/intc-5249.c  |   10 +--
 arch/m68k/coldfire/intc-525x.c  |   12 +--
 arch/m68k/coldfire/intc-5272.c  |   20 +++---
 arch/m68k/coldfire/intc-simr.c  |   38 ++++++------
 arch/m68k/coldfire/intc.c       |   28 ++++-----
 arch/m68k/coldfire/m5206.c      |    2
 arch/m68k/coldfire/m520x.c      |   26 ++++----
 arch/m68k/coldfire/m523x.c      |   12 +--
 arch/m68k/coldfire/m5249.c      |   16 ++---
 arch/m68k/coldfire/m525x.c      |   12 +--
 arch/m68k/coldfire/m5272.c      |   16 ++---
 arch/m68k/coldfire/m527x.c      |   40 ++++++-------
 arch/m68k/coldfire/m528x.c      |   28 ++++-----
 arch/m68k/coldfire/m5307.c      |    2
 arch/m68k/coldfire/m53xx.c      |  122 ++++++++++++++++++++--------------------
 arch/m68k/coldfire/m5407.c      |    2
 arch/m68k/coldfire/m5441x.c     |   12 +--
 arch/m68k/coldfire/m54xx.c      |   18 ++---
 arch/m68k/coldfire/nettel.c     |   16 ++---
 arch/m68k/coldfire/pci.c        |   56 +++++++++---------
 arch/m68k/coldfire/pit.c        |   20 +++---
 arch/m68k/coldfire/reset.c      |    4 -
 arch/m68k/coldfire/sltimers.c   |   18 ++---
 arch/m68k/coldfire/stmark2.c    |   12 +--
 arch/m68k/coldfire/timers.c     |   38 ++++++------
 arch/m68k/include/asm/io_no.h   |   16 +++++
 arch/m68k/include/asm/mcfgpio.h |   12 +--
 arch/m68k/include/asm/nettel.h  |    4 -

