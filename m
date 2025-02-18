Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC681ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883182; cv=none; b=k2MPtPfcrsTKA8Mu1og3czKwz25uP/2YWUfypWoG5tMsbAcN8SO6Zs+axctBxUQ05Tee2pW99T9X4Truh4AiB6Q991lF2Dyj8jKe6zoI2Ipn8n3VgYAUA59WkYPoJfWuS4t5xDn/xSVY/c0drDuPEqhekYRCUMrcJw0tml+940c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883182; c=relaxed/simple;
	bh=7obwrUTWULnL7Icw7goSLsUfNZz1ACl0rPuSwoLOAXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjPG1yZerFkyOEDhVykSGLdi3VR4VH3X5GMI1SkO7CQcMGuuoJ+gwy5BaF3uHIaxGYO3eHm9tfDSI80/O+tIO7EI+sd/5tc3kGnoZf9czMP4vuQyveoeqUYEsiQsllAVvGJ+V1lyn7xitBDH5WUU6dfJku+FqgInygsEpQe2fMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFBBBA40BA4;
	Tue, 18 Feb 2025 12:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B7CC4CEE2;
	Tue, 18 Feb 2025 12:52:59 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 09/13] m68k: coldfire: add devicetree for mcf5475-evb platform
Date: Tue, 18 Feb 2025 22:46:29 +1000
Message-ID: <20250218125124.2692982-10-gerg@linux-m68k.org>
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

Add a simple devicetree to support the Freescale MCF5475-EVB platform.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/boot/dts/Makefile       |  1 +
 arch/m68k/boot/dts/mcf5475evb.dts | 55 +++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/m68k/boot/dts/mcf5475evb.dts

diff --git a/arch/m68k/boot/dts/Makefile b/arch/m68k/boot/dts/Makefile
index d69e37b48558..f0e9643e6b71 100644
--- a/arch/m68k/boot/dts/Makefile
+++ b/arch/m68k/boot/dts/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dtb-y += mcf5208evb.dtb
+dtb-y += mcf5475evb.dtb
 
diff --git a/arch/m68k/boot/dts/mcf5475evb.dts b/arch/m68k/boot/dts/mcf5475evb.dts
new file mode 100644
index 000000000000..247a938bfafd
--- /dev/null
+++ b/arch/m68k/boot/dts/mcf5475evb.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+/ {
+	model = "Freescale MCF5475EVB";
+	compatible = "mcf5475evb";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	coreclk: clock-266000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <266000000>;
+	};
+
+	intc: interrupt-controller@ff000700 {
+		compatible = "fsl,intc-2";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = <0xff000700 0x80>;
+	};
+
+	uart0: serial@ff008600 {
+		compatible = "fsl,mcfuart";
+		reg = <0xff008600 0x80>;
+		interrupts = <99>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+
+	uart1: serial@ff008700 {
+		compatible = "fsl,mcfuart";
+		reg = <0xff008700 0x80>;
+		interrupts = <98>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+
+	uart2: serial@ff008800 {
+		compatible = "fsl,mcfuart";
+		reg = <0xff008800 0x80>;
+		interrupts = <97>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+
+	uart3: serial@ff008900 {
+		compatible = "fsl,mcfuart";
+		reg = <0xff008900 0x80>;
+		interrupts = <96>;
+		clocks = <&coreclk>;
+		status = "okay";
+	};
+};
-- 
2.43.0

