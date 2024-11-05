Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474D1D0B91
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805296; cv=none; b=IDZworT0Z2DSj+0CGCuA2xKDlmsRDqPuJeXbGEnnuD7Eyn7+pAQXCcOWI8EIVDngFtX5sysbkEeybW2KCPhs4d7XLgq8IAZyPzPxeJji0g/PulM5Xn3jZK56v+JuDsIhfBunl4tv+8AeNrFchWKtXnaqewAvzCIzKRHyZG1YjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805296; c=relaxed/simple;
	bh=so2fPI3clwvcrYfC/PbjiwiugrYkHen2PgiFD6+5Eoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cByL1/5Nju/bTajh/Y8Fwr5IJKX6gowhMZnYvOTsqVUrP+Tjv4G4yOh5oqDfsivKNSOs9u6ewPjSGi5UQfdz7UX7sfhGTaERRZl2k8vsJLVHZFWUND1gFdu6gK/u7+NRad/OO/XmpZCjfZdoNMGhlJSHCtmWG2wu1kEKg6AXwxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by michel.telenet-ops.be with cmsmtp
	id YzEr2D00131l0Qj06zErPC; Tue, 05 Nov 2024 12:14:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8HW3-006J4U-4L;
	Tue, 05 Nov 2024 12:14:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8HWM-000nIv-QM;
	Tue, 05 Nov 2024 12:14:50 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Make sure NR_IRQS is never zero
Date: Tue,  5 Nov 2024 12:14:46 +0100
Message-Id: <71db70dc27b46e5326518cd23cb94fa6bee172fe.1730805216.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling an MMU kernel without any platform support, e.g.
"MMU=y allnoconfig":

    echo CONFIG_MMU=y > allno.config
    make KCONFIG_ALLCONFIG=1 allnoconfig

NR_IRQS is zero, causing a build failure:

    kernel/irq/irqdesc.c:593:3: error: array index in initializer exceeds array bounds
      593 |  [0 ... NR_IRQS-1] = {
	  |   ^
    kernel/irq/irqdesc.c:593:3: note: (near initialization for ‘irq_desc’)
    kernel/irq/irqdesc.c:593:22: warning: excess elements in array initializer
      593 |  [0 ... NR_IRQS-1] = {
	  |                      ^
    kernel/irq/irqdesc.c:593:22: note: (near initialization for ‘irq_desc’)

Fix this by setting the default value of NR_IRQS to 8, which is the
mininum number of interrupts on any m68k CPU (the DIP48 variant of the
MC68008 has tied IPL0 and IPL2 together, but that does not impact the
range).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v6.13.

 arch/m68k/include/asm/irq.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index 14992fde7340161e..2263e92d418ab752 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -28,10 +28,8 @@
 #define NR_IRQS	32
 #elif defined(CONFIG_APOLLO)
 #define NR_IRQS	24
-#elif defined(CONFIG_HP300)
+#else /* CONFIG_HP300 etc. */
 #define NR_IRQS	8
-#else
-#define NR_IRQS	0
 #endif
 
 #if defined(CONFIG_M68020) || defined(CONFIG_M68030) || \
-- 
2.34.1

