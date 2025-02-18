Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CA1ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883181; cv=none; b=cvjiumslLO0XWL/1kVEdSdXEdtMmnJfTTWZ2VGcSDwKGpH3qJKGJOZJrx7PKzt8SAVxRlM3SQdIr5ABF2yTeeCGE5kpJblfzgb/1/HzSbri30OEQvWT03IPco491XA53Rz7ISZYi0AF8/b3Bvuxoxvbxl7DTLsNJhiZQT7Knd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883181; c=relaxed/simple;
	bh=jX/0ZLAucS2Rzel36akyUF9zQ2CwJz3qCwPboDLR3Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pg1qbBqyrrNeBzVTqXoHmJEulMpDpRyhq0lSJwxNfB27XvNTiHQaB/QMYXZ1KiVnX2EoXkwFHhzzNFc4u+5IdBEZ5GHNm1IGSofK63r4tyxR7VOPXPghER29RKASo8fygcAaImCb1lTsaQQHtxyLiXmbmFL0Vd6vSxR3/XnSXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08F57A40BA3;
	Tue, 18 Feb 2025 12:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D845FC4CEE6;
	Tue, 18 Feb 2025 12:52:57 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 08/13] m68k: coldfire: add devicetree for mcf5208-evb platform
Date: Tue, 18 Feb 2025 22:46:28 +1000
Message-ID: <20250218125124.2692982-9-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218125124.2692982-1-gerg@linux-m68k.org>
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple devicetree to support the Freescale MCF5208-EVB platform.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/boot/dts/Makefile       |  4 +++
 arch/m68k/boot/dts/mcf5208evb.dts | 57 +++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/m68k/boot/dts/Makefile
 create mode 100644 arch/m68k/boot/dts/mcf5208evb.dts

diff --git a/arch/m68k/boot/dts/Makefile b/arch/m68k/boot/dts/Makefile
new file mode 100644
index 000000000000..d69e37b48558
--- /dev/null
+++ b/arch/m68k/boot/dts/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-y += mcf5208evb.dtb
+
diff --git a/arch/m68k/boot/dts/mcf5208evb.dts b/arch/m68k/boot/dts/mcf5208evb.dts
new file mode 100644
index 000000000000..b6c32779b495
--- /dev/null
+++ b/arch/m68k/boot/dts/mcf5208evb.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+/ {
+	model = "Freescale MCF5208EVB";
+	compatible = "mcf5208evb";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc_simr>;
+
+	coreclk: clock-166000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <166000000>;
+	};
+
+	intc_simr: interrupt-controller@fc048000 {
+		compatible = "fsl,intc-simr";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = <0xfc048000 0x80>;
+	};
+
+	uart0: serial@fc060000 {
+		compatible = "fsl,mcfuart";
+		reg = <0xfc060000 0x80>;
+		interrupts = <90>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+
+	uart1: serial@fc064000 {
+		compatible = "fsl,mcfuart";
+		reg = <0xfc064000 0x80>;
+		interrupts = <91>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+
+	uart2: serial@fc068000 {
+		compatible = "fsl,mcfuart";
+		reg = <0xfc068000 0x80>;
+		interrupts = <92>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+
+	fec: ethernet@fc030000 {
+		compatible = "fsl,m5208-fec";
+		reg = <0xfc030000 0x800>;
+		interrupts = <100>, <104>, <106>;
+		interrupt-names = "int0", "int1", "int2";
+		clocks = <&coreclk>, <&coreclk>;
+		clock-names = "ipg", "ahb";
+		status = "okay";
+	};
+};
-- 
2.43.0

