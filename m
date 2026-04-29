Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2547E3328FA
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472699; cv=none; b=luenk+c0jULZGEwlx5m01tf4KCFYttfuaThi9IIAJ5Ff8+0XoVqv6aADzJvUYfyZOYLKGboWTZImocANwU5s8Dk0Ngqqo0mN6X4Ob3fUMh3Yn1mBICvpVxxNr5eMJGNj5el4+aQGpjbMHYYi7T7XUuVzBbPINcoPoMZsI8oZ5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472699; c=relaxed/simple;
	bh=+ouDMAS1aqCBGJAQEs9JB1VV55M0fDpzKkeNPIOuPSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iePHyP5G9wh6lWV+nb5ZMYl/U20Vm1vNmsXguvlBW03dSokvAtoVCObwU79ImtzFH5yZWux9ZUL2ELhF09i8m9LeA4ot1pHuMLkZX0nxth050xXhkB0LJlJZyl5fHzAWgSJXYbfThgYRLVBh3U+r+1Ld3BSHidOaSSKsE9cwdI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 873D1441AF;
	Wed, 29 Apr 2026 14:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDC8C2BCC4;
	Wed, 29 Apr 2026 14:24:56 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: m68k: defconfig: new and updated ColdFire defconfigs
Date: Thu, 30 Apr 2026 00:24:04 +1000
Message-ID: <20260429142452.1200856-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Add new defconfigs for platforms based on the 5329 and 54118 ColdFire
SoC devices. There is no existing defconfig support that covers these
long time supported SoC parts, so this is to improve test and build
coverage for those.

Add a defconfig for the NETtel 5307 ColdFire based board. The 5307
ColdFire SoC has been supported from the start, but some platforms
like the NETtel have some quirks and extra hardware peripheral support
not used on other ColdFire platforms. So a defconfig for it improves
test and build coverage.

Lastly refresh the existing ColdFire defconfigs, making sure that
modules is enabled on all platforms.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/m5208evb_defconfig  |    9 ++-
 arch/m68k/configs/m5249evb_defconfig  |    9 ++-
 arch/m68k/configs/m5272c3_defconfig   |    9 ++-
 arch/m68k/configs/m5275evb_defconfig  |    9 ++-
 arch/m68k/configs/m5307c3_defconfig   |   10 ++--
 arch/m68k/configs/m5329evb_defconfig  |   77 ++++++++++++++++++++++++++++++++++
 arch/m68k/configs/m5407c3_defconfig   |    9 +--
 arch/m68k/configs/m54418evb_defconfig |   70 ++++++++++++++++++++++++++++++
 arch/m68k/configs/m5475evb_defconfig  |   12 ++---
 arch/m68k/configs/nettel_defconfig    |   56 ++++++++++++++++++++++++
 10 files changed, 238 insertions(+), 32 deletions(-)

