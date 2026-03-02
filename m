Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C93A1D02
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Mar 2026 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447129; cv=none; b=n0KjPHPlh1Qu1BeSdaRoj6aLf2/Kvb0fRwANUkdXrEwKMq1PgShsqfL8SbmSzQsIPkn3k5TWnzSN2uN0F3nnC8gO+zyMk7COma1tNcEiYs5pV2xA7MU69qMxvvnjuneah2KGRKNbyDSNTsNfdp+IHXCkdkhIFRkYPir2eOrU6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447129; c=relaxed/simple;
	bh=u4H7VYkjJKluMxFTfthNQRtuDMGQjKB5jo/OimLQkDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMHHuyLdIJOlAwuSl1a9Gy2oBzfwxORvKxYRaDlKX/JbyxPOJHVsDDOug1/uWs8ssNFx+GzZbSZDwDJGXU90KrhhEQ32ZIm4b1L7eYYii0VBZcd4wZ4gSTV/5D+9qkuGbiNNPFfTUsQSxopAL3keFU0QnFFzdAMQ+jyJmqCtsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB94044361;
	Mon,  2 Mar 2026 10:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894E0C19425;
	Mon,  2 Mar 2026 10:25:27 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Philip Blundell <philb@gnu.org>,
	Kars de Jong <jongk@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] m68k: defconfig: hp300: Enable monochrome and 16-color linux logos
Date: Mon,  2 Mar 2026 11:25:19 +0100
Message-ID: <51190cab2bb1adb9554aaaba9fae54342653a338.1772446429.git.geert@linux-m68k.org>
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

According to "HP 9000 Series 300 Computers: Video Signals and
Monitors"[1], HP Topcat and Catseye graphics hardware varieties support
monochrome, 16-color, 64-color, and 256-color displays.  Hence enable the
standard black-and-white and 16-color Linux logos, too.

[1] https://www.hp-series300.net/docs/monitors.pdf

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/hp300_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 308836b60bba4d52..35761920185c9415 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -386,8 +386,6 @@ CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_HID=m
 CONFIG_HIDRAW=y
 CONFIG_UHID=m
-- 
2.43.0

