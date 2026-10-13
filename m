Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE8503BE3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Oct 2026 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893466; cv=none; b=V6wD1SOH32ziJ0xcrIIlHxaOCbx8bJfcGZf8ZFiWqC5UkqBQH+ALSVvVP5vSF8Yggug1Jod4Uh7Sec9Xl6JBWC82aDDfk1KugLXEnRJzDrGEod4Eqo+wwz9sBYSND4OavOn8tAL4B2xe7moszf8+YGPgBLcYfrXAFp2jq+HAwKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893466; c=relaxed/simple;
	bh=xmKW265b6860R1wcClFYRHw4xte3scoJd/t7EdfSBew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BX4gG0+BP+D7BiqsEjlml9BRLEJFBo3gjKSJz61f8T7bsSv+dXoYyFmYYIGXmP95POOBeSYp0/MOMOjkZSpT9yIBYcgoRRJhnz7AlBCULX4Wl0Bj/FCBEIifyqk1iL7dyl5Q89lVse9uMIqO5XmGuAQAZsPn1eikR+De5oL7Q9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59D0960A59;
	Tue, 13 Oct 2026 12:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99A41F00893;
	Tue, 13 Oct 2026 12:11:02 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org,
	linux-serial@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
Date: Tue, 13 Oct 2026 22:07:02 +1000
Message-ID: <20261013120831.1046590-5-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013120831.1046590-1-gerg@linux-m68k.org>
References: <20261013120831.1046590-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create documentation for a new binding to support the Freescale ColdFire
UART hardware block. This is found on pretty much all variants of the
M68K derived Freescale ColdFire family of System-on-Chip devices.

It is not compatible with any other known UARTs.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 .../bindings/serial/fsl,mcf-uart.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml b/Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml
new file mode 100644
index 000000000000..d1dba518f67a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/fsl-mcf-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale ColdFire UART
+
+maintainers:
+  - Greg Ungerer <gerg@linux-m68k.org>
+
+allof:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: fsl,mcf-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    uart0: serial@fc060000 {
+        compatible = "fsl,mcf-uart";
+        reg = <0xfc060000 0x80>;
+        interrupts = <90>;
+        clocks = <&coreclk>;
+    };
-- 
2.55.0

