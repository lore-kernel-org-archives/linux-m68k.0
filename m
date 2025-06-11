Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09AF26E6EF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642067; cv=none; b=dNZIaROddYWrzNO2bVVccG54LPN03cT6EuzwljlzCyejjRxXMDcmXSbdDDNulMaixvvSjH3sBwOyXg7jxmceocJQZVViRyW8V7z0Rr32IwD9KCPo1OyTqlpSJPOyjPMXgDNNs6sJEQMjqG1v9U5Ojd77twbCRUG00Wy6e/hQPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642067; c=relaxed/simple;
	bh=rZ0zvi28l1ukvpo0XyM5nQnFn6b0NBgI6Zhy3uH+b3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfTuJk/VU8VViYjm0WnzVg+yqadVebRb4BxnOt0ZynI+CmXJCe8B+5cKeRC2VJjUw4GR1YYe+DEt/ecKM1iEgUDZAvd+FgimDRFhFSunok8JA3WLbh3o9PGnsG5Pg4zuD5EIDBKCSq8MluB/l73axCjCcnuH3dAG/xNh9Lt1cJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=egcw4i5Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="egcw4i5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749642064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eOMqJTJmLauU1Yqmyrgr3U7LB7TOvCdgHAQ81c6XRIc=;
	b=egcw4i5YXWVCwe7QMfp50HIIoJYWcMDvGydyZqyBw6KCgqAlpVwHa6Jl8EgpFwaVKJDhqH
	GLHStz9OfdIWPGQ8O0zHN2H8YQTlFCTe35wLWsH1NK1ucZNvntCgpF8wW91GpXU1+UPGUN
	EdyU339VmZHmp/QRY7RVy103BtVBa2o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-zDBcJLujMCO1kuDWIHoPHw-1; Wed,
 11 Jun 2025 07:41:03 -0400
X-MC-Unique: zDBcJLujMCO1kuDWIHoPHw-1
X-Mimecast-MFC-AGG-ID: zDBcJLujMCO1kuDWIHoPHw_1749642062
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC149195608C;
	Wed, 11 Jun 2025 11:41:01 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.174])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7FE3019560A3;
	Wed, 11 Jun 2025 11:40:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-m68k@lists.linux-m68k.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers 
Date: Wed, 11 Jun 2025 13:40:54 +0200
Message-ID: <20250611114056.118309-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

The x86, parisc and sh patches already got merged via their specific
architecture tree:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda

So I assume the m68k patches should go via the m68k tree.

v2:
- Split the m68k patches from the global series
  (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
- Rebased the patches on linux-next and fixed the conflicts
  and new occurances of __ASSEMBLY__

Thomas Huth (2):
  m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/m68k/include/asm/adb_iop.h           |  4 ++--
 arch/m68k/include/asm/bootinfo.h          |  4 ++--
 arch/m68k/include/asm/entry.h             |  4 ++--
 arch/m68k/include/asm/kexec.h             |  4 ++--
 arch/m68k/include/asm/mac_baboon.h        |  4 ++--
 arch/m68k/include/asm/mac_iop.h           |  4 ++--
 arch/m68k/include/asm/mac_oss.h           |  4 ++--
 arch/m68k/include/asm/mac_psc.h           |  4 ++--
 arch/m68k/include/asm/mac_via.h           |  4 ++--
 arch/m68k/include/asm/math-emu.h          |  6 +++---
 arch/m68k/include/asm/mcf_pgtable.h       |  4 ++--
 arch/m68k/include/asm/mcfmmu.h            |  2 +-
 arch/m68k/include/asm/motorola_pgtable.h  |  4 ++--
 arch/m68k/include/asm/nettel.h            |  4 ++--
 arch/m68k/include/asm/openprom.h          |  4 ++--
 arch/m68k/include/asm/page.h              |  4 ++--
 arch/m68k/include/asm/page_mm.h           |  4 ++--
 arch/m68k/include/asm/page_no.h           |  4 ++--
 arch/m68k/include/asm/pgtable.h           |  2 +-
 arch/m68k/include/asm/pgtable_mm.h        |  8 ++++----
 arch/m68k/include/asm/ptrace.h            |  4 ++--
 arch/m68k/include/asm/setup.h             | 10 +++++-----
 arch/m68k/include/asm/sun3_pgtable.h      |  8 ++++----
 arch/m68k/include/asm/sun3mmu.h           |  4 ++--
 arch/m68k/include/asm/thread_info.h       |  6 +++---
 arch/m68k/include/asm/traps.h             |  6 +++---
 arch/m68k/include/uapi/asm/bootinfo-vme.h |  4 ++--
 arch/m68k/include/uapi/asm/bootinfo.h     |  8 ++++----
 arch/m68k/include/uapi/asm/ptrace.h       |  4 ++--
 arch/m68k/math-emu/fp_emu.h               |  8 ++++----
 30 files changed, 72 insertions(+), 72 deletions(-)

-- 
2.49.0

