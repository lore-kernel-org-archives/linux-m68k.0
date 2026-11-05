Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885340;
	b=t+0nZj0fS7ZqyssDzUNuYVkFUO8WIKMQ9JJYDQQbJ43xurprRltfMYIlr7tHd1NzXQ0m
	 ZkQbEXZO9+wN3dklnA7hoLrE69ecat4SU/r+nuDskDWNdMTGgBJoC5YJX45/9KflPobh0
	 zXLYQ3G3YbMOdqmcFJ74z8WBd1Yd7ZD4qvbf3V19veFC9+2QvHwZ9qKa7znIpSNi2b0EY
	 wMRC5jpTWPXV5JrBwtrKrOsKduZc+6XVgLNWiHQNxoC4spr38TQIxKEMzzUuv6gqDo5Kv
	 yEQl8wQUMREUeUiJcIDB8w3lGb3DlDsgm8lcM5HrayoYULafdnUF0IyL9dp8D7Cu9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885340;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version:X-Virus-Scanned:X-Virus-Status:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=S7gTFWi0vVr5NLYp53sjQKqE4pWLhfHhEbWgZHbtI/c=;
	b=WG6pTzUzSKltRcdAn+V+wzr+eyTthAbTEUGQsaBJoZFPW9v2x0Zp4b8tUYvbdTs3l4kZ
	 iNx6GUtto8W5EA4MN7+4q+rpWu9ySInlzGOZuhSZ3qv7ngdxxYbb1loJ20czgkZQhIGrA
	 EwYEysMdpSIjmqZnhlSOGGmEvLhMJKUtyPGkh3JD9sbswu+C59gOTQHEOPiDLafJVRgsh
	 zsYmpGfKD3inUSWsz1R0kIXSCnEhP84VKCDiQ/54H5PCRsm4YqvyamSfU3t2FbCSZWhok
	 F8rtoNkDbkR9M+GMuDUVT2rO7d7yJ4dnwJ7ZZsJ5M1TKtYOpRwuc0f5u8CidjabwOiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morknet.de;
	spf=pass smtp.mailfrom=morknet.de;
	dkim=pass header.d=morknet.de header.i=linux-dev@morknet.de header.a=rsa-sha256 header.s=s1-ionos header.b=h6JcHTJ3;
	arc=none smtp.remote-ip=212.227.17.24
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D5A606A31B;
	Thu,  5 Nov 2026 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D5A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morknet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morknet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morknet.de header.i=linux-dev@morknet.de header.a=rsa-sha256 header.s=s1-ionos header.b=h6JcHTJ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=morknet.de;
	s=s1-ionos; t=1793885331; x=1794490131; i=linux-dev@morknet.de;
	bh=S7gTFWi0vVr5NLYp53sjQKqE4pWLhfHhEbWgZHbtI/c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h6JcHTJ3kcxANUEvlIYJMKBIAg5re/wb95CadZrdfmr/6pKT6bcLy44kCIlepBdO
	 v75XFtEDA+q+ilguzdX8RsGScazFAjeM6Lx5NdQ9RvGNnl8KDqBlbg1Ra+ICdkVxP
	 XJwfIi7zwBNFYaELQCa2g3ZeMXQuTpql1SjBcF40Q0tBwNq3VnqKyxFfeCdlF/JqN
	 3LJq+IoXLN+h7w6lA81yV+Tes5b/ge7VqMKKz86VF9QOJErFRt4QE2c79OS8JITIR
	 tVsAzpVp4zhQohuYhHm1Hhy9TP1H5nfCmo3RFkRk7bBPlbzEPrBjvH4u5+ogVgsdt
	 huovL5xb2HfugmB2HQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvbJw-1wXXcb267C-00xRJC; Thu, 05
 Nov 2026 14:28:51 +0100
Received: from sagittarius.morknet.de (sagittarius.morknet.de [192.168.19.11])
	by mail.morknet.de (8.18.1/8.18.1) with ESMTPS id 6A5DSooP2302739
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 5 Nov 2026 14:28:50 +0100
Received: from sagittarius.morknet.de (localhost [127.0.0.1])
	by sagittarius.morknet.de (8.18.1/8.18.1) with ESMTP id 6A5DSnwR1226355;
	Thu, 5 Nov 2026 14:28:50 +0100
From: "Steffen A. Mork" <linux-dev@morknet.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thorsten Blum <blum@kernel.org>,
        "Steffen A. Mork" <linux-dev@morknet.de>
Subject: [PATCH] m68k: amiga: lower min_low_pfn to make RAM DMA-able
Date: Thu,  5 Nov 2026 14:27:52 +0100
Message-ID: <20261105132752.1226267-1-linux-dev@morknet.de>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.5.4 at scorpius
X-Virus-Status: Clean
X-Provags-ID: V03:K1:J14B5c7YwR2N9gMsetXHm4+Wu1qhcawR18LP4f0jPAWhGlfdXPB
 n56wUoDVEHb6QxFy8KCE+wSyYO65Sxnc0dDo03FXFAA5upn61McKhxHlKTouCawkN/pC61v
 QTAGW505GJo0auskfqaYfvaIIEy3ZDmPQqy48DUNH9uAvwH2z5cTpFe8oZgOrkJPLa4NBbv
 pfpLRZcn8/ciBv21mKivw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LL5QYpsPr1E=;ewhKAqIqk41VuZWR2+ezZ0IPfGE
 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

With reference to the patch by Denis Ahrens for the MVME16x platform, this
patch works in the same way for the Amiga. Currently, all DMA-capable SCSI
controllers have ceased to function due to the same underlying issue. Whil=
e
the wd33c93=3Dnodma parameter can be used as a workaround for the wd33c93
driver on the Amiga 3000, other drivers =E2=80=94- such as the zorro_esp d=
river
(tested on a Blizzard 2060) -=E2=80=94 fail completely once memory has bee=
n
released by free_initmem().

Applying this patch restores proper functionality to both the Amiga 3000
SCSI controller (without requiring the wd33c93=3Dnodma parameter) and the
Blizzard 2060.

Link: https://lore.kernel.org/r/C718B642-57B9-48F3-8C0C-87DCB31A8495@h3q.c=
om
Tested-by: Steffen A. Mork <linux-dev@morknet.de> # native Amiga 2000 with=
 Blizzard 2060
Tested-by: Steffen A. Mork <linux-dev@morknet.de> # FS-UAE virtual Amiga 3=
000
Signed-off-by: Steffen A. Mork <linux-dev@morknet.de>
=2D--
 arch/m68k/amiga/config.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 6e89e7f7e98b..c48aa3dbd837 100644
=2D-- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/zorro.h>
 #include <linux/module.h>
+#include <linux/memblock.h>
 #include <linux/keyboard.h>
=20
 #include <asm/bootinfo.h>
@@ -854,3 +855,38 @@ static void amiga_get_hardware_list(struct seq_file *=
m)
 #ifdef CONFIG_VT
 EXPORT_SYMBOL_GPL(key_maps);
 #endif
+
+/*
+ * Make all system RAM available for DMA.
+ *
+ * paging_init() sets min_low_pfn to the first free page
+ * after the kernel image. free_initmem() later releases
+ * the init sections, but min_low_pfn remains unchanged.
+ *
+ * This prevents dma_capable() from mapping those pages.
+ */
+static int __init amiga_init_dma_pfn_limit(void)
+{
+	unsigned long pfn =3D ULONG_MAX;
+	int i;
+
+	for (i =3D 0; i < m68k_num_memory; i++) {
+		unsigned long mem_pfn;
+
+		mem_pfn =3D m68k_memory[i].addr >> PAGE_SHIFT;
+
+		if (mem_pfn < pfn)
+			pfn =3D mem_pfn;
+	}
+
+	if (pfn >=3D min_low_pfn)
+		return 0;
+
+	pr_info("Amiga: lowering min_low_pfn 0x%lx -> 0x%lx\n",
+		min_low_pfn, pfn);
+
+	min_low_pfn =3D pfn;
+
+	return 0;
+}
+arch_initcall(amiga_init_dma_pfn_limit);
=2D-=20
2.43.0

