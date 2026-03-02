Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696C3ACA74
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Mar 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447132; cv=none; b=CTF5sG78UEaBCWc+MdJKXkJwzFUsGnAY4zxw2k4VkPjfDfv5vno+4clbol2iP4xCbp5BckXi1YimNrl/P+XrpxI+hDNpB5DXUaephLatpJ6PlHPMtM1DHWgfCv0Vx8vdtwEhm60+6zN18CrMp/2hC7e+QeDqPXqN+TVQ5y5pPeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447132; c=relaxed/simple;
	bh=NhEynpVUwf2dEQfTtRjtpKs4GyahD50TPuVKbef/vUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBa9h6W7TY4fx3wAOzye/NEYeCelxbDi+yHKIqtJe/fob2FtmA+U346W442c4o6e/iNxKl0A1HhqOr6ezejH2y9oAlPZDIe2r8NVPyMTx6s3iS/IbjNyGK4H1XCAbgMUc6QpbXjBkS2ZKLthAvd47yei1PM+MSm8Ucj/9XMRsHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 778F6600AE;
	Mon,  2 Mar 2026 10:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14844C2BCB1;
	Mon,  2 Mar 2026 10:25:28 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Philip Blundell <philb@gnu.org>,
	Kars de Jong <jongk@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] m68k: defconfig: Update defconfigs for v7.0-rc1
Date: Mon,  2 Mar 2026 11:25:20 +0100
Message-ID: <67dd5553e9289757c274d79ce1b13fca33fde25d.1772446429.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772446429.git.geert@linux-m68k.org>
References: <cover.1772446429.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Restore the state of the standard black-and-white and 16-color Linux
    logos (no longer auto-enabled since commit 994fcd4b107d747b
    ("video/logo: don't select LOGO_LINUX_MONO and LOGO_LINUX_VGA16 by
    default").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig  | 2 ++
 arch/m68k/configs/apollo_defconfig | 2 +-
 arch/m68k/configs/atari_defconfig  | 2 ++
 arch/m68k/configs/hp300_defconfig  | 2 ++
 arch/m68k/configs/mac_defconfig    | 2 ++
 arch/m68k/configs/multi_defconfig  | 2 ++
 arch/m68k/configs/q40_defconfig    | 2 ++
 7 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index d21385e6dedb2fcc..7f98cac5952db2d5 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -427,6 +427,8 @@ CONFIG_FB_FM2=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
 CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_SOUND=m
 CONFIG_DMASOUND_PAULA=m
 CONFIG_HID=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index c0c419ec9a9e9b53..f6fdb836c922f66a 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -384,7 +384,7 @@ CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_MONO=y
 # CONFIG_LOGO_LINUX_CLUT224 is not set
 CONFIG_HID=m
 CONFIG_HIDRAW=y
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index c542b720b5cd93fc..96834189131c3f3f 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -406,6 +406,8 @@ CONFIG_FB=y
 CONFIG_FB_ATARI=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_SOUND=m
 CONFIG_DMASOUND_ATARI=m
 CONFIG_HID=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 35761920185c9415..15ac1ffd6ca65326 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -386,6 +386,8 @@ CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
 CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_HID=m
 CONFIG_HIDRAW=y
 CONFIG_UHID=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 97e108c0d24f2014..b9b0905fc3bc9f87 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -405,6 +405,8 @@ CONFIG_FB_VALKYRIE=y
 CONFIG_FB_MAC=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_HID=m
 CONFIG_HIDRAW=y
 CONFIG_UHID=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 9960b9d3aa6a2b82..95cd11f5f137eef0 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -486,6 +486,8 @@ CONFIG_FB_MAC=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
 CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_SOUND=m
 CONFIG_DMASOUND_ATARI=m
 CONFIG_DMASOUND_PAULA=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 36eb29ec54eeb982..4c98bb1fdcfc6af3 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -393,6 +393,8 @@ CONFIG_PTP_1588_CLOCK=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_SOUND=m
 CONFIG_DMASOUND_Q40=m
 CONFIG_HID=m
-- 
2.43.0

