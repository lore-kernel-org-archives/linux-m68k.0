Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB81B4F02
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jan 2025 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387630; cv=none; b=ZlQpVCgHUdTZlW9MLCLnHw2dizcv1MTy0i/EchBjdSWqy+SwsmNSGscFZdj/hyLX8icdg3csRF1+GXj76uQdRSW42TlRY9+moiNY7tIpxKE0bFcMDci4sCxrLWi8DZjE28/Nc0VdSc4lFhOjy5FXBzaUYbLSrVsTljfWQLQ/4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387630; c=relaxed/simple;
	bh=WXMvEIIBqOi5va9V9shT9p3DEqnQOmt8y9iortZqIuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aeRHFjdoRGN1CY2ObXb4UY8kN7Fae0EKFBye/e36aYddFEm/jWwVZb+kVc9wOA3QCNYyUGaT8eqEjnPdEMfjlERkFPiKpaPmmVmvf9vRMywmzlCnjUaHEwcGhfkfQ7+seUYc5mD8woCvEUveYO3JJMRZUCoeZ+ugCN+Pfn+z7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:30c9:4dcf:fe21:4b10])
	by xavier.telenet-ops.be with cmsmtp
	id 3TgQ2E0020raqVW01TgQnQ; Mon, 20 Jan 2025 16:40:24 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZtsv-0000000DhmU-1Y1S;
	Mon, 20 Jan 2025 16:40:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZtt1-0000000DW5h-3aSp;
	Mon, 20 Jan 2025 16:40:23 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sam Creasey <sammy@sammy.net>,
	Christoph Hellwig <hch@lst.de>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: sun3: Fix DEBUG_MMU_EMU build
Date: Mon, 20 Jan 2025 16:40:22 +0100
Message-ID: <b1d12a1d24b4aea9f98d905383ba932b2dc382e6.1737387419.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With DEBUG_MMU_EMU enabled:

    arch/m68k/sun3/mmu_emu.c: In function ‘mmu_emu_handle_fault’:
    arch/m68k/sun3/mmu_emu.c:420:38: error: implicit declaration of function ‘get_fs’; did you mean ‘sget_fc’? [-Werror=implicit-function-declaration]
      420 |         pr_info("seg:%ld crp:%p ->", get_fs().seg, crp);
	  |                                      ^~~~~~

    [...]

    arch/m68k/sun3/mmu_emu.c:420:46: error: request for member ‘seg’ in something not a structure or union
      420 |         pr_info("seg:%ld crp:%p ->", get_fs().seg, crp);
	  |                                              ^

Fix this by reintroducing and using a helper to retrieve the current
value of the DFC register.

While at it, replace "%p" by "%px", as there is no point in printing
obfuscated pointers during debugging.

Fixes: 9fde0348640252c7 ("m68k: Remove set_fs()")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested only.

Alternatively, this could use the existing GET_DFC() from <asm/movs.h>,
but (1) that would require adding an intermediate variable to store the
output variable, and (2) currently mmu_emu.c doesn't use any of the
[GS]ET_*() macros.
---
 arch/m68k/include/asm/processor.h | 14 ++++++++++++++
 arch/m68k/sun3/mmu_emu.c          |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 8f2676c3a9882dcd..3c43c09d44894528 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -95,10 +95,24 @@ static inline void set_fc(unsigned long val)
 			      "movec %0,%/dfc\n\t"
 			      : /* no outputs */ : "r" (val) : "memory");
 }
+
+static inline unsigned long get_fc(void)
+{
+	unsigned long val;
+
+	__asm__ ("movec %/dfc,%0" : "=r" (val) : );
+
+	return val;
+}
 #else
 static inline void set_fc(unsigned long val)
 {
 }
+
+static inline unsigned long get_fc(void)
+{
+	return USER_DATA;
+}
 #endif /* CONFIG_CPU_HAS_ADDRESS_SPACES */
 
 struct thread_struct {
diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index 7b15cc12637bf314..b39fc3717d8eaebd 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -371,7 +371,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 	}
 
 #ifdef DEBUG_MMU_EMU
-	pr_info("%s: vaddr=%lx type=%s crp=%p\n", __func__, vaddr,
+	pr_info("%s: vaddr=%lx type=%s crp=%px\n", __func__, vaddr,
 		str_read_write(read_flag), crp);
 #endif
 
@@ -418,7 +418,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 		pte_val (*pte) |= SUN3_PAGE_ACCESSED;
 
 #ifdef DEBUG_MMU_EMU
-	pr_info("seg:%ld crp:%p ->", get_fs().seg, crp);
+	pr_info("seg:%ld crp:%px ->", get_fc(), crp);
 	print_pte_vaddr (vaddr);
 	pr_cont("\n");
 #endif
-- 
2.43.0

