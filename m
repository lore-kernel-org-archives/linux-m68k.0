Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5E382374
	for <linux-m68k@vger.kernel.org>; Tue,  9 Jun 2026 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035950; cv=none; b=l/94TBYAPvuNiHfcK2qPXQk2CHnZw1/p6qBAIcDCQm1Eo8hWaU9Oo0MtdiLKhCoinFtAD95pB2tnRdMT32Y4EQ+0GebkfrBp+vrQTVbTgYb7IvYgI+OaBDgRXVBG0ZNn4AK1DQ5O2P4SeQelqbSUZ/457phqh2T7ih0z+PrwKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035950; c=relaxed/simple;
	bh=vwK3UYyB+ZXEIXhuV1rTDODzhrulPGJiTkKomwOsR7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miz6KSmQeH471KkaXBdl1gNkvAJwa7vzGklXOz60XTG8QRtdY7mqvrXC5QAXd8dhAnUCogHJrn0iQh1xOKTGoNgMVQiBCiT9KW9I4Hbc3yU6JJLEfUQdE3rkxrWTtOLie0ukKNBiC80ta2qFk6XnAYw5mrqD096NnPaT+/REC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwES2TLD; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwES2TLD"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-13832028e9fso1231281c88.1
        for <linux-m68k@vger.kernel.org>; Tue, 09 Jun 2026 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781035948; x=1781640748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF1AQvI39hMyTodcqdAS0HH4/XIdHFhvmAKlMbpIfMw=;
        b=iwES2TLDzInNplRo3rPsbc5ZzBTkpd6Zk0Ri6DDJvBbY2S05BruByhbtNjNmBkhKgj
         Yfx5iar/P1a+lYPfhZw5/DnSAEtDyJsES8ZmV4GI+O9d7wmTDgtg5Kt22vP94oGC4pNc
         /A5CPZ6eQZ6N07DuPVIqQJGhQvxMWDfr2DfGZv+cMsS+MwKQmZ/94CVIJFE0laynylXL
         O5Nydi4klwUWworRxspW1CKdmpf7UwbXWIwii5LSoa1CGil1Fg6urIa6YRp0fMlDVUSa
         1UY1+HD3mVnIPrfI9Ke+YRgqOsy7R70gR4wiXjiVNMCeruGvBlhIGdBSyHo4CNwBZ3h9
         1TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035948; x=1781640748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF1AQvI39hMyTodcqdAS0HH4/XIdHFhvmAKlMbpIfMw=;
        b=j2ppqH89ZL3Zyjhum7kSHIxYm75cTDhFnRlXPcwy6a8st2i8OVF30gElgJzLKDBM99
         o/ZshXQXoNGUNGwfBieXE7FrXGH7TizTtXLtQRmUP4myZ+DPcLOo585oM4WZJYD8gm+P
         tfK+TTNeiELZzZK7awKEaBtUheggInekVD6AIFvBAHjopGbHW67cBpLWLvgHGIN32Mhm
         3BFjyClpU9BKyniIPUAZhpkdz5ZNuejyFIHHcfXnsVNnm20eUSpivLHBB8icYXmBmzT8
         A+pRURRE88QlUl05DPRV92gCJ1Sg491qfMzpR/HvtMAKC5wphxLpaGLBi0yhTxsCaZPj
         8BUw==
X-Gm-Message-State: AOJu0Yz5iH5ZJE/b8eCR5er4hdZ+EAB8GZrsEkIFv4dZt/AEr3nDMb8Y
	PceQ7rnhxHvQ/qiq4TMtf2FqNXTpfsmFl5baUnU7GICCEcTuMMUPgiYfrjyhBiJX
X-Gm-Gg: Acq92OGVZFVvp6ocHTGzh8A0SvyDtSQcd4W+wu39yt1DbjDZgmAmgtrLH7uM8fjWeY4
	Fgkj5kkd8DojKWR7kAooKIqqX1HLuLzLIfUXKnXr2O4bPP2GVHDd8sJG+F+2ptTLV8jMHfjkfj9
	W3N8ZajXACVuts2UnDRyPEDJD/V94SdjXgH2CSnCclgemwv6I5mh5nv0pW/BtFqD5oEpn9SWGgQ
	K9foGToXIJpMNdSryRgWI1oLg3i/dKdH1odj5E2BqVVScRdusfAC7KRktJvuG7Tqh0VVtcWpLr7
	rwjvET/sTHvn5WvnhtMYhSbJrpNks2cwRI+vZZOSOQhVEhI8MtbK3Vbplig0X7rs45aWMu4zqvQ
	RTFj7q8TDJ53oc+dODaC1RX78PpdkNIWM12DD/xmRhth4wBsJcjx8IMkU3nwezmxOQ7erqXw3H2
	suODsEhQbk5Hi53QoGttLvo5n8C+FH0ic822NMuipfoL4IoOjDNH4ywQFxBehYOzPWb6nEP5c4V
	FJg83mlDcuSw5bdVyIhxhOtlh547laoUMRB2phnZUyrF0/UP+aw1hxuJ9qF43YdNbiaAzIG+VMA
	kOD1LQa2PwWR+DX/E0FvEfro01Qe
X-Received: by 2002:a05:7022:98e:b0:12d:bab2:f213 with SMTP id a92af1059eb24-138066fbf9bmr10967469c88.21.1781035948292;
        Tue, 09 Jun 2026 13:12:28 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm12335281c88.13.2026.06.09.13.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:12:27 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-m68k@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] m68k: correct CONFIG_MVME16x macro name in #endif comment
Date: Tue,  9 Jun 2026 13:12:08 -0700
Message-ID: <20260609201211.173438-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in arch/m68k/kernel/head.S incorrectly refers to
CONFIG_MVME162 and CONFIG_MVME167 instead of CONFIG_MVME16x. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/m68k/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 2e4ef0358887..502eeae49eaf 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -1110,7 +1110,7 @@ L(not147):
 	jbra	L(mmu_init_done)
 
 L(not16x):
-#endif	/* CONFIG_MVME162 | CONFIG_MVME167 */
+#endif	/* CONFIG_MVME16x */
 
 #ifdef CONFIG_BVME6000
 
-- 
2.43.0

