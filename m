Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F85390C85
	for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Oct 2026 23:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761522; cv=none; b=d2AxaKMvCXeVzwzWzreMSp1HskHKGczZHrwr3btkpJ9fUUA07QVU/tMa/650M+et3Wikw/I33ZqC50Oh7k00pDN6v/nNKUscDRaVFynzNj1bEknBA1urjTzshQ+v+c9aEWvrx+0z8iNUxof1T3zid1aD4nisNtzEPGxXfE5EjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761522; c=relaxed/simple;
	bh=Ju+bip0M/AWTfK9kzxOgDc3k9hpS3uz2OON5w/To1QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GGKRW/lvirkCYZRnTc3FHZwY7kaJxdj9Bb4ncgLS4Sb7pa9esTK9rY1GSfmsSiqMLihD9uuJpPjcYcnThucnuPxLFskOLsYZQeF+LyWsYBu8zk85eGNvDoA/HYpLjkkekxHntq8Mi2228MTQVop0OSaUl2eZlSEl7yYuPtzdnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0v5h54N; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0v5h54N"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C161B41877;
	Sun, 11 Oct 2026 23:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21291F0089B;
	Sun, 11 Oct 2026 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791761520;
	bh=ib+MNRIsarxsKzHOzeDk05/jA+kx8VUx4E79y5R626I=;
	h=From:To:Cc:Subject:Date;
	b=g0v5h54NBhZ9RdJQzcgvfWkw0dEItCH5V245VWRgSn6KkTmmRjM7LX5vyEml43Dq0
	 GUrHM9mOA0QNVujxMXrwdcgQ6w0mTajNe3fjF9ibfFyqdlg4ooUlHv2OfVORJGLCt9
	 sRiPFceRdVj2CBwj/7Po9UTluh8WzDPnTF065+yBhDy0FpjLLkXq/4vAc+rs8wTQRC
	 q71szkLAbYBVWwiRRTaYhGBzjkCBXVkPCIpDNvmfeIW+5ImisCEIE0TpBSUBT7UEHW
	 6xY/1BfI59rUdoRoVbrz+cCDHf98G92XbrEc/kMbrsSc/5wqSkL9sS2JCWNX525o87
	 64dbbr9Ng7jUQ==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: coldfire: only setup smc91xx on NETtel platforms that need it
Date: Mon, 12 Oct 2026 09:31:35 +1000
Message-ID: <20261011233135.1300744-1-gerg@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Fix the following compile error found in a rand config:

    ../arch/m68k/coldfire/nettel.c: In function 'nettel_smc91x_init':
    ../arch/m68k/coldfire/nettel.c:126:9: error: implicit declaration of function 'mcf_setppdata' [-Wimplicit-function-declaration]
      126 |         mcf_setppdata(0, 0x0080);

The following config options are key to generating the error:

    CONFIG_COLDFIRE=y
    CONFIG_M5206e=y
    CONFIG_NETtel=y

The problem stems from the fact that CONFIG_NETtel applies to a family
of hardware platforms that covers a number of different CPUs and SoCs.
This specific file, arch/m68k/coldfire/nettel.c, applies only to the
ColdFire based platforms. The problematic section of code in this file
is to supply the platform setup code for those hardware platforms that
have dual SMC91xx ethernet devices. The ColdFire M5206e based NETtel
platform does not have SMC91xx devices at all.

Modify nettel.c so that the SMC91xx platform setup is conditionally
compiled in for only those platform types where it is used.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/nettel.c    |  2 ++
 arch/m68k/include/asm/nettel.h | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/m68k/coldfire/nettel.c b/arch/m68k/coldfire/nettel.c
index e304571e03ea..b2bc5c012769 100644
--- a/arch/m68k/coldfire/nettel.c
+++ b/arch/m68k/coldfire/nettel.c
@@ -18,6 +18,7 @@
 #include <asm/mcfsim.h>
 #include <asm/nettel.h>
 
+#ifdef NETTEL_SMC91XX
 /***************************************************************************/
 
 /*
@@ -152,3 +153,4 @@ static int __init init_nettel(void)
 arch_initcall(init_nettel);
 
 /***************************************************************************/
+#endif /* NETTEL_SMC91XX */
diff --git a/arch/m68k/include/asm/nettel.h b/arch/m68k/include/asm/nettel.h
index 30bc915c3d97..e5516666a98c 100644
--- a/arch/m68k/include/asm/nettel.h
+++ b/arch/m68k/include/asm/nettel.h
@@ -40,6 +40,11 @@
 
 #ifndef __ASSEMBLER__
 
+/*
+ * 	This family of platforms has dual SMSC91xx network chips.
+ */
+#define NETTEL_SMC91XX
+
 extern volatile unsigned short ppdata;
 
 /*
@@ -81,6 +86,12 @@ static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
 #define	MCFPP_DTR1	0x0000		/* Port 1 no DTR support */
 
 #ifndef __ASSEMBLER__
+
+/*
+ * 	This family of platforms has dual SMSC91xx network chips.
+ */
+#define NETTEL_SMC91XX
+
 /*
  *	These functions defined to give quasi generic access to the
  *	PPIO bits used for DTR/DCD.
-- 
2.43.0

