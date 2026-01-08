Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E983A0B10
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 06:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852960; cv=pass; b=gqdBfbUG1hTkmArscYb4LFR0pnLCyNSU1M/3lzuM5Dkgpl43qMU95VGDtpctyl/6jmN8cmNQhRaJlit7fp6pkDz+LMNiLwf0ZVcN0asim2PkPEEU46oWyKgNek9+hv6eDqWZSif38STwzjFKMf36DOEqb4CU/vyjSF26TUOmV40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852960; c=relaxed/simple;
	bh=MumNukqbwNvLqDeqCSJa+uUMNxxYSz91Z3aMcDNQMlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2yukk3hDRT9BEhMYJgmfJfeLbU9Wi8XSt+x9grC5OCDnqQuLOMSZWQl/AQRga7G/ciN+h8qqVJIKkMfrs2IICBVQqD63SS841NH1T41JfHJcpXzyeO5gyBzhr+0DxkjPhNM58bjOQDe78xt9LG3PnCQf3r1NglCG6+zDpHw7p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=LWZmSci6; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="LWZmSci6"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id 0019881758;
	Thu,  8 Jan 2026 06:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852371; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=3oe3GsQfvL2lw80C49h26zcBSsYlIYX/xdWZx/pQWrE=;
	b=LWZmSci6rVmP5nCH6qFBEyWNTm+ZMx2BOf+7/Z3hH2j9KKSHV16/h4sxumzXmHxOjAsnRL
	uti+JmJrxRODWDeQVgOeOUnT9WMAgGVhpZLjYwoxQ/I7kdzAfi+VVQptFZfxZMMRDG/bVS
	f7lpMrBIX/1BK3yoPslWWAY4X94mMPY=
From: Stefan <stefan.reinauer@coreboot.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	Stefan <stefan.reinauer@coreboot.org>
Subject: [PATCH 0/5] m68k: Add vDSO + clock_gettime support
Date: Wed,  7 Jan 2026 22:05:28 -0800
Message-ID: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852371; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=3oe3GsQfvL2lw80C49h26zcBSsYlIYX/xdWZx/pQWrE=;
	b=Ytrq+Bnmg1jZx7WZ7wQRkofwlOlwqKz+5YQt8jhRf1tClbEcpGDdhbX+zIhIh+hf5ZlBGh
	oT9rPuTkSqzMfj7KAbehlelrZ7Bt9n3GiVMV9GAxYWMxONsSMqBs0ZL9mkBTi4pENoT3dZ
	tfJaELmdozYlCWz9qh2oS4tJXtZxHPk=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767852371; a=rsa-sha256;
	cv=none;
	b=nephx49RG+dwPTSZlAOqH2t4NZbI/wUv6sesKl7HdleOyoC2NyPx7AMdGP1S0/qZSyWgC7mfLAdogg1HDAz/8piqpYHtZ82u3olRTPYWek/IehJmijmpR9OpgoTPFT/sbGdnkHP1LI14x+OmUA5FFTEnIprH+HSwU4Vsvn8kIoY=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: ++++
X-Spam-Level: ****
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org

This patch series adds vDSO (virtual Dynamic Shared Object) support for
clock_gettime() on m68k, significantly improving performance for
applications that frequently query CLOCK_MONOTONIC.

Motivation
----------
Many applications call clock_gettime(CLOCK_MONOTONIC) frequently for
timing, scheduling, and performance measurement. Each syscall on m68k
has significant overhead (~2000+ ns). By implementing clock_gettime in
a vDSO, userspace can read the hardware timer directly, avoiding the
syscall overhead entirely.

Implementation
--------------
The implementation maps three pages into userspace:
  - vvar page: Contains clock state (tick counters, conversion factors)
  - timer page: Read-only mapping of hardware timer registers
  - vDSO code: ELF shared object with __vdso_clock_gettime64

The kernel updates the vvar page on each timer interrupt using a
seqlock pattern for consistency. Userspace reads the current timer
value directly from the mapped hardware registers and combines it with
the vvar data to compute the current time.

Platform support:
  - Mac: VIA 6522 Timer 1
  - Amiga: CIA-B Timer A

The vDSO code is carefully written to avoid libgcc dependencies,
implementing 64-bit shift and division manually since m68k lacks
native 64-bit operations.

Performance Results (QEMU Quadra 800)
-------------------------------------
Before (syscall):     ~2057 ns/call
After (vDSO):         ~675 ns/call
Improvement:          ~3x faster

Note: On real hardware, the improvement may be even more significant
since QEMU's syscall overhead is relatively low.

Current Limitations
-------------------
- Only CLOCK_MONOTONIC uses the fast vDSO path
- CLOCK_REALTIME falls back to syscall (wall-to-monotonic offset
  tracking not yet implemented)
- Other platforms (Atari, etc.) fall back to syscall

Testing
-------
Tested on QEMU Quadra 800 emulation with a modified glibc that uses
__vdso_clock_gettime64 when available. The glibc changes required are:
  - Define HAVE_CLOCK_GETTIME64_VSYSCALL "__vdso_clock_gettime64"
  - Define VDSO_NAME "LINUX_5.0" and VDSO_HASH 61765872

Stefan Reinauer (5):
  m68k: Add vDSO support for fast TLS access
  m68k: Extend vDSO with clock_gettime() support infrastructure
  m68k/mac: Hook VIA timer into vDSO for userspace clock_gettime()
  m68k: Add vDSO userspace clock_gettime64 implementation
  m68k/amiga: Hook CIA timer into vDSO for userspace clock_gettime()

 arch/m68k/Kconfig                   |  15 ++
 arch/m68k/amiga/config.c            |  42 +++-
 arch/m68k/include/asm/elf.h         |  21 ++
 arch/m68k/include/asm/mmu.h         |  19 +-
 arch/m68k/include/asm/mmu_context.h |  78 ++++--
 arch/m68k/include/asm/tlbflush.h    |   8 +-
 arch/m68k/include/asm/vdso.h        | 141 +++++++++++
 arch/m68k/include/uapi/asm/auxvec.h |   8 +
 arch/m68k/kernel/Makefile           |   3 +
 arch/m68k/kernel/sys_m68k.c         |   7 +
 arch/m68k/kernel/vdso.c             | 264 ++++++++++++++++++++
 arch/m68k/kernel/vdso/Makefile      |  39 +++
 arch/m68k/kernel/vdso/vdso-clock.c  | 369 ++++++++++++++++++++++++++++
 arch/m68k/kernel/vdso/vdso-note.S   |  14 ++
 arch/m68k/kernel/vdso/vdso-tls.S    |  32 +++
 arch/m68k/kernel/vdso/vdso.S        |  18 ++
 arch/m68k/kernel/vdso/vdso.lds      | 283 +++++++++++++++++++++
 arch/m68k/kernel/vdso/vdso.lds.S    |  67 +++++
 arch/m68k/mac/via.c                 |  37 ++-
 arch/m68k/mm/mcfmmu.c               |   2 +-
 arch/m68k/sun3/mmu_emu.c            |   2 +-
 21 files changed, 1435 insertions(+), 34 deletions(-)
 create mode 100644 arch/m68k/include/asm/vdso.h
 create mode 100644 arch/m68k/include/uapi/asm/auxvec.h
 create mode 100644 arch/m68k/kernel/vdso.c
 create mode 100644 arch/m68k/kernel/vdso/Makefile
 create mode 100644 arch/m68k/kernel/vdso/vdso-clock.c
 create mode 100644 arch/m68k/kernel/vdso/vdso-note.S
 create mode 100644 arch/m68k/kernel/vdso/vdso-tls.S
 create mode 100644 arch/m68k/kernel/vdso/vdso.S
 create mode 100644 arch/m68k/kernel/vdso/vdso.lds
 create mode 100644 arch/m68k/kernel/vdso/vdso.lds.S

-- 
2.51.0

