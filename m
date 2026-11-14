Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=172.234.252.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647766;
	b=HPNjQCBaUQ18HcuyOHWPYzpvHcOCz/+UJcZuD+ErfvLaYXP8VqnG1xXFvjfgJy2RIBBW
	 wLDs7aAr3/yTC8wmwT15y51ALdB3xH8F3Y5U3Sb1g2DxNDQoKyasu0ICaZWoMNR9Ryblh
	 CSiBFBcUGm3+bFvqUwhPjwzxWVJcobhccBrTdXJLlYkSXowSNXI/RiYGOsZwfpFixkaM8
	 vuvbMUGIZUMEHCnaqpRD7d8Y1WyVcWb6DUv5/+LLkTFe/93RaTyJvEroneYzATfx1bs0/
	 4A9FkJyNzafTcXc+JGR5K4JA3xBtSKsZvwP2/isg+e8QqOHgOjilahsZ4U2Gr3h6R+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647766;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aTbbdR/qOGATnnoTFgzD+rURB4vEOXobvcmYmJirh24=;
	b=af94sV3yHcSVYIVsU+rNr/l5HW/o5Fn8+Du5kbiLPbj6jqrMdM2DAwTqiGe7h6agTb0p
	 sk432eOWYlkbleRYDtgX0rfdFPAG+ihA69MtnZgNqO/9o4LSm+7ErAc+JGRjsF53yZoOT
	 A6N8eauuPfpgOtMjycgfAdI+rpUsIL1htha7h/bN+3uneHyvo9Bs+/Rx5ZtcXhJtyu5bs
	 cBnrYa7LBj721r0/kNYrZmcVhnt5OPJtPbzk125mlMkYs3Sz5auHw3odoOimODs8KrXnO
	 Gp3dfIwQxxa9YeLC8rZydvQP0OxvTpl56CcXXKJI8aW2yPwk4loBODrA0FWtlWE/VEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JKyyNaFO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B696606A332
	for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Nov 2026 09:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B696606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JKyyNaFO
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07860422BA;
	Sat, 14 Nov 2026 09:16:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794647764;
	b=dBLdDI+yUPUGXc/CJnrCjRxR66hxZ5WY2ZQSkCsuiJ36BCAa0ZqYTwcqtlfKJCf/W4dV
	 vsCoKDOpl/Cgxw2ed9D73LgIa6YbGBQZivP/iosCqrjeu1paLN4gF10PnS9TxyR//kerN
	 EPAqIsKMpTgNb1JIFpURZEMHqo6180AmoMHM+rUqJPkqzeEwQ7FDrkInvcEpFSBq40I7j
	 Py7pmzDDqliaEXqu3Nd26+CiN42Lg6pUrHLJZkXbM3Dmy8qOcgViWw/M+FvoTSOFbmJpf
	 WKc17l58N8ut5krHxuH06n5eZ4CkE986MudqXOD8UhzT2G6XRy+wUiSZWeSkL4LytSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794647764;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=aTbbdR/qOGATnnoTFgzD+rURB4vEOXobvcmYmJirh24=;
	b=tKfHS/c+u5a78ISKXu1JfmibKwdzr9SNuVZ/C4vGdVjEEBIegOWfKwk6B4Hdv1uMN0zh
	 6gbfgUzxr02EYiX7MsVId90ptRn47qa7fZ+589EgxX+6DtpanNMVXAzKfIMVFFjS8iaEF
	 HeEo2ikCzFmo0jhIYhwHPCJxWhpVcvGFUuEd3C3XcP1QiVUCAuZH+zpNE3igdG2omr58Q
	 xSKaYIDj7OXJqYpuIYnXope/P2ekWSdsvb9xeq2hYGfdSO+/YahXHZsC6+b0ZGfxU1g/a
	 95ATw/U97w9AG8q//ZbtiauxqRVa2t7kUti5D1FsHR+Jw3r8Yn6j1aJ97OIvBYJkdgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AABC1F000C4;
	Sat, 14 Nov 2026 09:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794647764;
	bh=aTbbdR/qOGATnnoTFgzD+rURB4vEOXobvcmYmJirh24=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JKyyNaFOKXbflHODQH29tH9/KDb3FHKRx3R8VMhymozPNDCO4ct+o8HGBTkRs/acY
	 zmEzAkzAc+Y1pe6v3duHCvljzcjZBmifdRFFiC2rZ4TfJ69Q/MQf6r2fjPmLbDDmom
	 IC9/dm/W1SueHBG4p6paAq2N9UcN3/Fwy1mASlgVHQe68nNcGQq7iagBOWXB2rmq6p
	 xSnBnvGPT68JtGK+ukiKriAh4emlEyS00FXRMWJH4sZDoMTn5YHqjixoQmsPbbHYFD
	 J/AoFTvJKfmfLA5JuNNIPhRnxNn576z/aY2SHiq5hk4LNbzhVS5+I4AhiGpNyyxPug
	 rHQ5cH8MikT8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AE0E549D11;
	Sat, 14 Nov 2026 09:16:03 +0000 (UTC)
From: Christian Zietz via B4 Relay <devnull+czietz.gmx.net@kernel.org>
Date: Sat, 14 Nov 2026 10:15:49 +0100
Subject: [PATCH] m68k: Preserve fixups during dead code elimination
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
X-B4-Tracking: v=1; b=H4sIAMQm+GoC/x2OUQqDMBBEryL73UCTlqC9SilhTTZ1ocayCSKId
 +/az8fMPGaHSsJU4dHtILRy5aUo2EsHccLyJsNJGdzVeWvtzWTeQiJMcUkU6MMzF2w6CnmR0Fo
 QnI33bhhcb+999qCmESuZUbDE6XRp0xTa2hl9hdT4P/B8HccPTt9ER5AAAAA=
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Sam Creasey <sammy@sammy.net>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Christian Zietz <czietz@gmx.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794647763; l=2837;
 i=czietz@gmx.net; s=20261113; h=from:subject:message-id;
 bh=UYLvKZBzNE+sBSp2JLnrfwCUbYDF4Z0Kocgxl/zojiw=;
 b=ewPMJ0lBlMkdQr2T23XANUpkboMvkGGSlqb+ofZhhS4Czu52r8eQtmR+d7nREuZEPYcsRtdDM
 RvvSgipjo6PC3z3h2JdA4cvtNhH3CkJCRJPazWTGFJuNquUnXTfD1Ug
X-Developer-Key: i=czietz@gmx.net; a=ed25519;
 pk=4CdkqAQq9wBZuj+KXG9PqH5ivA+edxVtP0VMbuoWu1c=
X-Endpoint-Received: by B4 Relay for czietz@gmx.net/20261113 with
 auth_id=1516
X-Original-From: Christian Zietz <czietz@gmx.net>
Reply-To: czietz@gmx.net
Content-Transfer-Encoding: 7bit

From: Christian Zietz <czietz@gmx.net>

A kernel built with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y panics when
loaded into TT-RAM (starting at address 0x01000000) on Atari. This is
due to the .m68k_fixup section being removed by the linker's dead code
elimination. Thus, the kernel is not fixed up for the TT-RAM address.

KEEP() ensures the fixups are always kept in the kernel binary.

Tested on an Atari TT and under Hatari emulation.

Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")
Signed-off-by: Christian Zietz <czietz@gmx.net>
---
For reference, here is the objdump output of a kernel built with
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y that shows .m68k_fixup is
missing:

m68k-linux-gnu-objdump -s -j .m68k_fixup vmlinux

vmlinux:     file format elf32-m68k

m68k-linux-gnu-objdump: section '.m68k_fixup' mentioned in a -j option,
but not found in any input file

... versus after applying the patch:

m68k-linux-gnu-objdump -s -j .m68k_fixup vmlinux

vmlinux:     file format elf32-m68k

Contents of section .m68k_fixup:
 3c5a8c 00000000 003a8478 00000000 003aa6f8  .....:.x.....:..
 3c5a9c 00000000 003aaafe 00000000 0000b5ae  .....:..........
 3c5aac 00000000 003aaed4 00000000 003aaefa  .....:.......:..
 3c5abc 00000000 0000c5f6 00000000 0000c61c  ................
 [...]
---
 arch/m68k/kernel/vmlinux-nommu.lds | 2 +-
 arch/m68k/kernel/vmlinux-std.lds   | 2 +-
 arch/m68k/kernel/vmlinux-sun3.lds  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 45d7f4b01..485bbc24a 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -72,7 +72,7 @@ SECTIONS {
 	PERCPU_SECTION(16)
 	.m68k_fixup : {
 		__start_fixup = .;
-		*(.m68k_fixup)
+		KEEP(*(.m68k_fixup))
 		__stop_fixup = .;
 	}
 	.init.data : {
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 7326586af..8783df430 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -45,7 +45,7 @@ SECTIONS
   INIT_DATA_SECTION(16)
   .m68k_fixup : {
 	__start_fixup = .;
-	*(.m68k_fixup)
+	KEEP(*(.m68k_fixup))
 	__stop_fixup = .;
   }
   .init_end : {
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index 1b19fef20..8be83d13d 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -40,7 +40,7 @@ __init_begin = .;
 	INIT_DATA_SECTION(16)
 	.m68k_fixup : {
 		__start_fixup = .;
-		*(.m68k_fixup)
+		KEEP(*(.m68k_fixup))
 		__stop_fixup = .;
 	}
 	. = ALIGN(PAGE_SIZE);

---
base-commit: 8c9ddebb300c719362a52a2d465f44e7d055778d
change-id: 20261113-fix_deadcode_elimination_for_tt_ram-6629928148f6

Best regards,
-- 
Christian Zietz <czietz@gmx.net>


