Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6D3B27EF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431767; cv=none; b=qxJtI1L45T1FRUnB1BZ/dVrLyZQSK5lAYiJA8tBZnDaSuNnvn5HcdkS95gBM+TtIUWEZ50mO+Bfpt9QOY4ohEECtpVq1JT/BzfLnTOOUx5NM0WEPBZCxdQaUqRBkCLzuU4skybMA46oy1sJR4LfU8gOot/L0HMXwTgV2FB3L9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431767; c=relaxed/simple;
	bh=ZwXQ0B97mAqYw+Pj4q1qkn3w0VEkp8PC3RW3zFe6OsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJJiIPmtpDUBw4oiUtTw+Gd0buxfHtdQU53hNF43pD/LlXJ+8DDooqIl5CcEKFmm7V7UXRkhxyewilTG5Vi8bi01QMMBNv3AHxi+5WquX54Vr67/0RLakkXdy2IBBm0D8um6xazrV2MdMpP8crhApmTh4hBxBDJ9t+tSoZhGaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cas8tNl9; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cas8tNl9"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB4A56013B;
	Fri, 17 Apr 2026 13:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C3CC2BCB0;
	Fri, 17 Apr 2026 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431762;
	bh=ZwXQ0B97mAqYw+Pj4q1qkn3w0VEkp8PC3RW3zFe6OsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cas8tNl9CxmcLPr+klpYOiOUpWw43pvARwfWzkMhAldp4ZiMUUD85xhwTjq7t6hVg
	 bIcshTUeASvThAOLJ6gi/HwyuE/Dir1wBYF/Hj5q8lgD/slBp7IQ7i63f0qexpV3wJ
	 Dpdik+ZOT2LUCaDE9CzA3t21t9MAph0JK/phP//57EZbMMfSI9howf1iEOjXKH+sGI
	 wHm+HbRaq2FdZdHUEirPh/MOgchAVjivRph3vR+xdxflx0o/dn8vCQediYu6KxEK78
	 e7BzDvigmM3Xpx9AtOQL++z/+7AN13/idhGEszTreTBLHfZ6xObY5Sgu3f+zx0TmNO
	 CMyLhJqHZ9Drw==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: reserved-memory: Change maintainer for BPMP SHMEM
Date: Fri, 17 Apr 2026 15:15:48 +0200
Message-ID: <20260417131549.3154534-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while ago, so change the maintainers for BPMP
SHMEM to Jon and myself.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
index 4380f622f9a9..6efadc5f8078 100644
--- a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Tegra CPU-NS - BPMP IPC reserved memory
 
 maintainers:
-  - Peter De Schrijver <pdeschrijver@nvidia.com>
+  - Thierry Reding <thierry.reding@kernel.org>
+  - Jonathan Hunter <jonathanh@nvidia.com>
 
 description: |
   Define a memory region used for communication between CPU-NS and BPMP.
-- 
2.52.0

