Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15002C21EB
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Oct 2025 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360372; cv=none; b=RYZU6hFaMCu2eVMV/+azyKFxTqhmjIYRMdUePpbYsviItW0ovlURlp9n1IRoqx5zr01XCpLXgPuAMUbjGiIKiHbOOfesusFLgwnDsYw/McUnUp3XgEc827R8BZ0Asv1Wt+MZBub5AO5W7RarH0dlUBF2Hm7/DfbeXpBXIfUoa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360372; c=relaxed/simple;
	bh=2R1PZIIxBinNd8P129jzA8RERXSgPSFllJXUsjHBc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqNF6DBq0Phe+ETI+55f40mA5z7+wBrZuXBEHjEOJLCzcX3sAurysGjwx67k4UVJ4bF1kR0/xWdRu3rWe75q/4d2l2nq5IkUoe3u7COTPUd0Rtn4uxL7RSATTdl8ZxHmkjUr8iFZe2xz7Qj3JdevFKHeN7XBRQfYLsNF/SkGbNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B99F96126A;
	Mon, 13 Oct 2025 12:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A194DC4CEE7;
	Mon, 13 Oct 2025 12:59:27 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v6.18-rc1
Date: Mon, 13 Oct 2025 14:59:22 +0200
Message-ID: <65e00bcb7b2980278bb087986ee405627aa32d8b.1760360254.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Drop CONFIG_SCTP_COOKIE_HMAC_SHA1=y (removed in commit
    2f3dd6ec901f29ae ("sctp: Convert cookie authentication to use
    HMAC-SHA256")),
  - Drop CONFIG_BATMAN_ADV_NC=y (removed in commit 87b95082db32ae1c
    ("batman-adv: remove network coding support")),
  - Enable modular build of the SHA-1 secure hash algorithm (no longer
    auto-enabled since commit 2f3dd6ec901f29ae ("sctp: Convert cookie
    authentication to use HMAC-SHA256")).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v6.19.

I did not disable CONFIG_XFS_ONLINE_SCRUB_STATS (CONFIG_XFS_ONLINE_SCRUB
defaults to enabled since commit 0ff51a1fd786f47b, causing
CONFIG_DEBUG_FS and a lot of other options to be enabled), but instead
sent a fix for the latter.  Still, we may want to reconsider
CONFIG_DEBUG_FS etc. in light of systemd[2].

[1] "[PATCH] xfs: XFS_ONLINE_SCRUB_STATS should depend on DEBUG_FS"
    https://lore.kernel.org/69104b397a62ea3149c932bd3a9ed6fc7e4e91a0.1760345180.git.geert@linux-m68k.org

[2] "[PATCH/RFC] m68k: defconfig: Enable options needed for systemd"
    https://lore.kernel.org/e93e50b85422cdb04e800f5008abf92babf6d509.1731591904.git.geert@linux-m68k.org
---
 arch/m68k/configs/amiga_defconfig    | 3 +--
 arch/m68k/configs/apollo_defconfig   | 3 +--
 arch/m68k/configs/atari_defconfig    | 3 +--
 arch/m68k/configs/bvme6000_defconfig | 3 +--
 arch/m68k/configs/hp300_defconfig    | 3 +--
 arch/m68k/configs/mac_defconfig      | 3 +--
 arch/m68k/configs/multi_defconfig    | 3 +--
 arch/m68k/configs/mvme147_defconfig  | 3 +--
 arch/m68k/configs/mvme16x_defconfig  | 3 +--
 arch/m68k/configs/q40_defconfig      | 3 +--
 arch/m68k/configs/sun3_defconfig     | 3 +--
 arch/m68k/configs/sun3x_defconfig    | 3 +--
 12 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 1ff6bee754377470..aab4bbda796ef903 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -265,7 +265,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -281,7 +280,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -584,6 +582,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 6af37716384ca72f..6b0bab7520351555 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -261,7 +261,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -277,7 +276,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -540,6 +538,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index e5349b4fa30d4a15..8588b3a1f6d7d2fc 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -268,7 +268,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -284,7 +283,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -571,6 +569,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 28492ef5145706dd..ed85517ff01c6a4f 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -258,7 +258,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -274,7 +273,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -532,6 +530,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 2fbefb16b72ef978..0217a698285618d0 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -260,7 +260,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -276,7 +275,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -542,6 +540,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index deec5df3f35a4ad7..a9ba431a94081694 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -259,7 +259,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -275,7 +274,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -559,6 +557,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index b03808fb545f78c6..3239cef425993026 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -279,7 +279,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -295,7 +294,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -647,6 +645,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 0d401db0e8f82b16..baf0fc7a66d94593 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -257,7 +257,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -273,7 +272,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -532,6 +530,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 90fb5b6bcf833aea..9cb732f0c6ce160d 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -258,7 +258,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -274,7 +273,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -533,6 +531,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index b89b0f7fe2dac747..6b3295e4c5aef47d 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -259,7 +259,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -275,7 +274,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -549,6 +547,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 8cc372c4df720651..1f3a2fad6d2f6600 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -254,7 +254,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -270,7 +269,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -530,6 +528,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index f4569f64c6e4e797..d8ef36564d506aca 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -255,7 +255,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_SCTP=m
-CONFIG_SCTP_COOKIE_HMAC_SHA1=y
 CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
@@ -271,7 +270,6 @@ CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
-CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_MPLS=y
 CONFIG_NET_MPLS_GSO=m
@@ -530,6 +528,7 @@ CONFIG_CRYPTO_AEGIS128=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SM3_GENERIC=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_XCBC=m
-- 
2.43.0

