Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091989;
	b=WTDIbhgK/d+x2uYjMgvC3D6eqLBZo82q0CLJ6tsLNw73r6+M8Cl5WSG+KLHgjyjHDwLt
	 1TfO1Gao/WlOevo5/fRZc8XMrm+nrhz5qRxImSdLLI4xkMxsurBLR+WIq+yJKS9BiKl+R
	 qfE304H7drAs+16QOJhDjFTTRurs8SUtrMGhtaNo9+tILzCLzEcHreKldtpWGy+LQObvp
	 PEmRKuSrPhdtKYyTlEh9nSlAHkTGFxBDZ75nSoxEo906KCO5FC+6ODRllW8pL9fwEBH/F
	 yZdIgt/uwZMEhqMdabG0a02nm43xHaqZqmFbnX6Kx1lAU7PEnJFMNVXM0L03IxchFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4j66UUUyFDica/rtzcFfGexPD2kyfgX64rNkVvuVvdM=;
	b=vx7rVwRPZXSNTSIwisJGDAtO8PtXme8Diw36+p54ub48apmLXhpQLVcu4Lfjz9Zw9gFM
	 xDZWHfEz4y2SjIRC/Dwa4Ko0/k/uHjktbMdhcDrzjlyXTCUcGtiQf0zfgBC8EUwPS0aJN
	 ehv6Olef/rqnxPWDLAq/hP1j1OMu9Zxemk6JHP28umcRneX2xYSMKh6XO/g/+FfCseRa+
	 pwTxCX/UchCpbcnfMAiLObRAiCEC4mwzHs1UhIYMTr/IHj+s9e+8RQzFx0TghTGFqki43
	 uDFEEjk1nZlUFhHtKfl7RLe9oCojnitd7QDEu2a7sjB47I3lclpCVBx0cFMzO7LPZHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=LWDiK5uZ;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2B60A260C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F2B60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=LWDiK5uZ
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1361578a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 04:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091989; x=1795696789; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4j66UUUyFDica/rtzcFfGexPD2kyfgX64rNkVvuVvdM=;
        b=LWDiK5uZ9r3pdUfmQ7AnyWCKiFELCCw+w5AE2LGpHQT32VAPrshxTSis46oNLNizin
         IqcYhx5Qo5Y3IXc78qkf3uKlaZZo3KRKO9i9beT/2urtZy2hi+3dFo8/NDkw4MeuZJk/
         hx+ge/KfSV8Uq/J8kNPSzmQnPXFo+gcm/YhbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091989; x=1795696789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4j66UUUyFDica/rtzcFfGexPD2kyfgX64rNkVvuVvdM=;
        b=no3KzuREO0fzHUyekPqxmpFkF3u+6SXXINtt4mbelfvXNj90+bm0TxsIeDg2Zenx4e
         fsWmsu4qKiHhr/wn+yiFPRzszYoPfuGlDJvJN+8r3SddMQN42pVUNaPH3k0rzfJ4Gkst
         Pa0AVFV0OTly0ryVHPqJjavLdm2jrKUmD4zrK8Js2h9gudpiJeX9IaOpTVnyMzR/CK2q
         lCbVM03DPDo9w8zs8qccB1rx9x62Jd0sJHfYXJMlttKhj3xO6Lmmsi5uj1/niBdODxlI
         P0e88A04C9sr9VQALJUrm389bktwYLe5oV5HJwhq6g4okyXuF2x6bIeFiTRN70mNt6BD
         Ym1g==
X-Forwarded-Encrypted: i=1; AL+hErH72QQVBl9Bhc/MXZDntTRXjVyKX3K191QYAML0XvWIdPZJrTf4pvxTULEr9WaAZc1w9C+P1/uiAQw/@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8X9IP9S31sgopHlKx0OsrHM9XqX5r9bd5xZMUwcF+qfdEaGtDu
	mfTS3gQjfdV2wecMgMmqicAtm+N1kzVtjD+zuQYmTG5d9yy1olBge9paBLnpNOCyPjscWkCXedR
	QxTdg
X-Gm-Gg: AZFdTZdcFh1fE1EirdQp/+rfqjnnUkzrQ4rSuFrKn8oIGI1eqEFNvIKrDYK6/YSbsty
	NmVuYL8l1Qr1XBy6xTdCKVkOJ4vQu3WLKms5LCGHn8D7o2WtxMA7hPmNCepapIOqflM57yS9HC2
	neERa+Ap3YtwMCxOqw+bPLIHSlPRqW+PKfMzXEEIQnsJ8b0zGZp6M1TzJhauc3E5BPkcjuHcwha
	jukxiuy2B9MDPo6pAqQ3t6Oic/JPEJia0aWxnPyJoltmasCe8BoPKINQf9G1+CzzSuFb5cdWhaB
	3PEFMSkMWXegf2JPvVH7la/cbjs3TjNGkhOp0A23bpz6TcK9LpbjTMEHkvJGd+WQpY/6U6wTUP7
	S3+0yHKAuLf0xlfPiwtymb8oRmwW553evSGC47pQmtk++4RIGosrVnD/Ehy55FZmBbBVxK+xRvR
	fazCXl0+P2jJZufIuvXLJwtXP8X3DQH8DACT2KFPW6Qvv1+pLstMDxT+pFtnERy0wb3IiZwUkIN
	8fvZ/Z046vLakatYnp4mLwZMKc8CYJuLYPe/i7vWvK89z5K73olSVjqAAmDCcnSxybCXrC/BcyH
	6OJ3UV865Hbvkhpp0unPub4kwql/jjLJ2ewAh7WyHiqdXhmlDZEG47sRv96lU+BQO0tGRw==
X-Received: by 2002:a17:90b:1d04:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b3d075985cmr5661944a91.11.1795091988924;
        Thu, 19 Nov 2026 04:39:48 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:48 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/4] m68k: show the 68060's PCR in /proc/cpuinfo
Date: Thu, 19 Nov 2026 21:35:58 +0900
Message-ID: <20261119123558.2108296-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the revision information etc from the PCR to /proc/cpuinfo.
This is useful to confirm the 68060 you have is actually the
revision written on the chip.

My Amiga A4000 with a full 68060, revision 6 looks like this:

  CPU:		68060
  MMU:		68060
  FPU:		68060
  Clocking:	49.3MHz
  BogoMips:	98.71
  Calibration:	493568 loops
  PCR:		0x04300601 (ID 0x0430, revision 6, superscalar)

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/kernel/setup_mm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 41b595256ad1..c61c00959c54 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -451,6 +451,16 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		   clockfreq/1000000,(clockfreq/100000)%10,
 		   loops_per_jiffy/(500000/HZ),(loops_per_jiffy/(5000/HZ))%100,
 		   loops_per_jiffy);
+	if (CPU_IS_060) {
+		u32 pcr = m68060_get_pcr();
+		u32 id = FIELD_GET(M68060_PCR_ID, pcr);
+
+		seq_printf(m, "PCR:\t\t0x%08x (ID 0x%04x%s, revision %u%s%s)\n",
+			   pcr, id, id == M68060_PCR_ID_68LC060 ? " LC/EC" : "",
+			   (unsigned int)FIELD_GET(M68060_PCR_REVISION, pcr),
+			   pcr & M68060_PCR_ESS ? ", superscalar" : "",
+			   pcr & M68060_PCR_I14 ? ", I14 workaround" : "");
+	}
 	return 0;
 }
 
-- 
2.55.0

