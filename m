Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385B3A3E65
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2026 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431764; cv=none; b=mbISVWSjrZ5s0U84ebqUKw1bzq5m92/ZZw3ZgO3j423sb/5cuywlpNxMXPJ70kI5OXNA5fJLPM+Exrt94K6FHLY40vK/hvPE1GJw2ao2Y0Antg2QNGroQpCq1ro/U6wYgTg49oKacOhLPYvAYWVno1jn7fKj4okFI32i1ERMW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431764; c=relaxed/simple;
	bh=3t8CdW+2lbkqrvxvlVhufeih1j58VNK7Gp9uCsojClc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzjedVNV7AKY+VflygjmFxIycHpOdLUVKyOo+TEF83PqNk4Yxd3kpD0EPV3av5NUscf5HeCv1ucIA9jwjYCG/A66G6Qi8O23sRYDlY/Agqe1ut8LjKRbVzEwzyGwx8+g/DKmlc80WsVEo9r8MWXF1+90zQPgzSdZGhemd9YX0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVbqZkQE; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVbqZkQE"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C22D060139;
	Fri, 17 Apr 2026 13:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266BEC19425;
	Fri, 17 Apr 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431759;
	bh=3t8CdW+2lbkqrvxvlVhufeih1j58VNK7Gp9uCsojClc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVbqZkQEN53h7akJNXk0j+ukEncZxIVmMr39H0JMt4EnZrnvgAvMcWbdTPE8sEgCo
	 VVg4LEWgAVvd09IV4ADTUmZMGVCuDxQkefWwciaRfMQlRtgGtDOY5SIWgAtDf90SMN
	 4UYl0y9UVy2CWHtZ+COl6V07Ob4WBKZ0DYfpVLo/5yM84Gs67gklmCinv6Qu9m7VgP
	 2knHhAT4cUe7cVDLyhcxCov0g15C0s30is4RkHhmRbQyyesFNKD0RlQD+0lZeDD71p
	 EASAEbI4aTmaf+cJunQsXB4ZESNHabuvmWqb35FM78tS1pEKAhTM2AKT/nuyzs0+tP
	 rLZZGIKztzPsg==
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
Subject: [PATCH v2 2/3] Documentation: ABI: Take over as contact for sysfs-driver-tegra-fuse
Date: Fri, 17 Apr 2026 15:15:47 +0200
Message-ID: <20260417131549.3154534-2-thierry.reding@kernel.org>
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

Peter sadly passed away a while ago, so I'll be taking over as contact
for this ABI documentation.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/ABI/testing/sysfs-driver-tegra-fuse | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-tegra-fuse b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
index b8936fad2ccf..47d5513100f6 100644
--- a/Documentation/ABI/testing/sysfs-driver-tegra-fuse
+++ b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
@@ -1,6 +1,6 @@
 What:		/sys/devices/*/<our-device>/fuse
 Date:		February 2014
-Contact:	Peter De Schrijver <pdeschrijver@nvidia.com>
+Contact:	Thierry Reding <thierry.reding@kernel.org>
 Description:	read-only access to the efuses on Tegra20, Tegra30, Tegra114
 		and Tegra124 SoC's from NVIDIA. The efuses contain write once
 		data programmed at the factory. The data is laid out in 32bit
-- 
2.52.0

