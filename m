Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1713A381B
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2026 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431763; cv=none; b=R95kiLlM0K+9BSX2xNZFohXd3vpUSfYupIxPzxW+I5olmgzCZ+dLZfF7+lkQSoTdq932JMuZqu+weno4RbNrcq+yebUtgKRdXNynQWVpMx6MWZljs/5orZs8cviuiX5vsk9E1pHYiE90fKXRQ7lmJkASLjxTV+FYrBbwcIGcDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431763; c=relaxed/simple;
	bh=CsBxhNpzoUuwJOaSktkuM40YkzYY3O1cx/QZRXjUfYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcuZEWd4Q3mt4wt3kAYC1e4F1ubVHQlS8S8jGkjjmSQjX5XEIojLqONH/QvsjfKviDjsV5nSvXiwPFx/+oyR2wDjLRlF4M6I+hlDxIY924uX+S2MObZilG8QafGpVg6gwCF4s0PSdm0rErS70/xycQXHZxlhntk5WViQmTUzWJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDPkPTvw; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDPkPTvw"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1529E60128;
	Fri, 17 Apr 2026 13:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CB6C19425;
	Fri, 17 Apr 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431756;
	bh=CsBxhNpzoUuwJOaSktkuM40YkzYY3O1cx/QZRXjUfYg=;
	h=From:To:Cc:Subject:Date:From;
	b=aDPkPTvwZG04fqo4mIKgpkVPZbA68bs1sNugmqJla/lLngqRlab2hsE8cLO2NtNhz
	 qAwEx8uDqhlt+GuJqyAv+sJwUQ+FLDKcVor3el0rnxPTA/x29Je9LcBBJf0qeZ5hjA
	 uMCqPr47ZEYQ+Hit5XRg3ydS/Aq8W/h0kl/fwHNUvU1UJcLnyt/thctCtvEKGOjmUL
	 Vz1p38C43OeJKU2+4UyqkQ6ZLUF0eCwDtz1qrJ7X6zyDDiVS+1SAFVa0Bs93HpPZLT
	 Dirva2dVzmH6AUxZhh/emecHUCHIvQFLupvvJmky0nW4muLdTTottnd9JLJaB7rTJ1
	 HaIQcHqLStxXQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
Date: Fri, 17 Apr 2026 15:15:46 +0200
Message-ID: <20260417131549.3154534-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while back. Paul did a much better job at
finding the right words to mourn this loss than I ever could, so I will
leave this link here:

  https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u

Co-developed-by: Paul Walmsley <pjw@kernel.org>
Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add more missing entries

 CREDITS     | 10 ++++++++++
 MAINTAINERS |  1 -
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 885fb05d8816..afd1f70b41cf 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3645,7 +3645,17 @@ D: Macintosh IDE Driver
 
 N: Peter De Schrijver
 E: stud11@cc4.kuleuven.ac.be
+E: p2@mind.be
+E: peter.de-schrijver@nokia.com
+E: pdeschrijver@nvidia.com
+E: p2@psychaos.be
+D: Apollo Domain workstations
+D: Ariadne and Hydra Amiga Ethernet drivers
+D: IBM PS/2, Microchannel, and Token Ring support
 D: Mitsumi CD-ROM driver patches March version
+D: TWL4030 power management and audio codec driver
+D: OMAP power management
+D: NVIDIA Tegra clock and BPMP drivers, among many other things
 S: Molenbaan 29
 S: B2240 Zandhoven
 S: Belgium
diff --git a/MAINTAINERS b/MAINTAINERS
index ef978bfca514..ffe20d770249 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26145,7 +26145,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
 M:	Prashant Gaikwad <pgaikwad@nvidia.com>
 S:	Supported
 F:	drivers/clk/tegra/
-- 
2.52.0

