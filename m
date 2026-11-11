Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415064;
	b=OsY/gjRvEg+btM5QSW0XuRpSrwpnAzHKtTNXfFPiBTrBoaN9+/g4JwmUbDmW0IMzXixP
	 sZoY3hCXEVthKB/fWm+C0GtUZP6TT8jWBITNRrcwUGk3KaAiL4f1O1bcZS9R7v36CrKP7
	 w4KsE/67lXw1SF/EeZ3zmWmLtSTn7VJwwBUu3ABhSMJBLG4l2bHBByNwD8yjnHazkRLCR
	 oYQiFCnxOv7kBJOHF20jWBsy62aFRfcITBJ9kCY2l5k3DQ0m553TF88uieNOj56kxErYP
	 rzLhR9zBp/RI6/ra1718aXn9lwiazZqjTeIWPGvlUViqjkd0gcyJ6YsskMigF6zjH4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O4LCoxfztIxiO4Ve6PdwkUlzn+vvBZo5he0KpnyIOes=;
	b=NVpcZkgWtmAzubfObCW2A7fY6jid8SmMFBR6/Qnz1/NuxrNQw3542mE9n1Ost0vXNz5t
	 JyUvvk0hrV8lQ7As7kC6Ui4JRreYyQNiCfa4KM9PHae9hoKHaQvGbWzFKWNYrTvJb02OE
	 GTQdRhQP8cyG8D+OH0JRKj/KYlRVzDdULK4KAc0io9Lb7hKwZxIYMLc4rRQz1ZaYRGbqP
	 JHxFpRBgj6CrueZ/ix4xBCeGfjWDcbsWpjafOo3EBdlJHB+p25L1vlpoaGXGbH+n30eCK
	 y5f2iByssXnYcVKiifh1UWHdZc0Jsc81QvguhdnmCUmBS5yZILUfsCL+4m8iocNW8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YG7Qqp+3;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858C4606A8B3
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858C4606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YG7Qqp+3
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1810900f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415063; x=1795019863; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4LCoxfztIxiO4Ve6PdwkUlzn+vvBZo5he0KpnyIOes=;
        b=YG7Qqp+3uFvcBhdVmAWh7DAU764GMrL/w6pURudeDOVk8o11rty3Ci/gKR5wFoJsPK
         JHJxF3pzvHwnYPHrqbIxvZPdYd5I0gfOUCn/K+9rtc5bK7EJPUZIvhtYx8a5NQEeQRzu
         z5FBKLdz68JJnG6PNvDxaIZnzusPaGvhABo5grP0ssFvRNKerfFsDr6egquk+SZzcYyT
         B0MCEoFfGDdwl2aQpRPgOjWd0JpqeYKHolRQedIjB1FW73VXnK7QZBJCompIMyWVPYSG
         a7fhRlKq3eT2wK4+cN94lZ7qA5d5GgHprtScTfjeVIuxtoCI96EJkO3ZpgQ2wispj7QR
         /g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415063; x=1795019863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4LCoxfztIxiO4Ve6PdwkUlzn+vvBZo5he0KpnyIOes=;
        b=KaUrrw7bDg4l8vj+LySBay/HbOUZpudEO5SCZfnM2GJwR1ZQHyNg4Oxnh0bplH7o0g
         LDtvBMQm3rrH+83p7L5d6gd1BIw+9XAQ0F1kdc8iQj0bE3TtxzG64m1y4O76zt+OBbm9
         Cd2SMwaV3ynDXN3LmCQ+0xFOYnwtBra9S7WWggq63lD2DdKJ3pKGNQXAS0k/sIp6GEqI
         1ZWm86OUEsrLlJCsFUMz2QwZ6e8yrAyg+lSzAxaVT2452W4ZwW+AfI1qdBH481NbTMV+
         ab7QkJObNtTu/okygnuvVhcpM5xF9foR7bk5pl8T6vbcoduEe6X2bsUMdJLglkJ20lKF
         VWiA==
X-Gm-Message-State: APuU4Z/dDbg0UvjuTZDwqBKN5VoLtWa6SAjnPEloVMbuvFLRj+WhP9q2
	ix01mmiOwk8R2lOCDELzA4CoGoRHkFG2d6Ad4igV0W3O0BfeG359Ali15pUeDddE
X-Gm-Gg: AYBFou1Oa2VMU90SYw3wNHQlHxpdGpiFH9pLNsmc/KQ4jbjRkoLovnQL7/sQ41ukXE5
	Uf3WTzIXWcYLIj18gEESOrdSLSf/hLJH3UOKUSmgGivhgS/OyuVDcHk9jK7h/Xgu3cEy7Pz6MRy
	CcA+fMqSvgdRjscl1wOSfARSB7Udi0nBqqf5WUwpmY6H+3bNhUIrIV7hF8KXOOUwsYKkJHnnhB0
	92+I3aK09ltREStRSmWWyCBysH4Awhu2j1wXPro7JeCz5SDHxmZODR9zXHyrAJnof3UIRyrjGIC
	WHqnFvREMaE1nnKmPhjb+Fwcsfb2w4597xK4p+yUFkKX+zEQMVK1bbP/tryHLfyiv5nTIbaQxQ7
	ljvqMWTo6k3Jwdb2/cN9MbNrovW2vsjsNUmgJuxkxT1JDLTNjAc0B70pFpGgXsxhNgXXSPSlCgQ
	D55pe9kb+BUs9b3/CY8Gnv1ufLDlU3cf121gJIFke9auGNRkmORyX66+lBCUvCSqNEW0mss9TQ1
	bVxgVACr1dUNixQZTRAnnr2qamCmJIPlwIXEKT34iJguWWDaZqpB8cFp5ZwApsjEtWNHv48rmJE
	Dup8qO3Ud/hYWRfmj0k+2R1MDqF7S+NeE21aE2yZs6Pk3sdMDFTeKAygE+2U14jgOztp2CeDvro
	57h1dJUo6zgHhmdFNvQ2bWf8v6DweIp6D7xU=
X-Received: by 2002:a05:6000:2213:b0:493:c7aa:7cef with SMTP id ffacd0b85a97d-499ca844595mr4406823f8f.52.1794415062584;
        Wed, 11 Nov 2026 08:37:42 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm11050119f8f.29.2026.11.11.08.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:42 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 5/7] zorro: warp mfd: expose the voltage and temperature sensors
Date: Wed, 11 Nov 2026 17:37:32 +0100
Message-ID: <20261111163735.227286-6-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The diagnostic frame carries the 5 V rail, the backup battery and three
temperatures - the 68060, its NTC and the ARM - as IEEE-754 binary32.

Decode the bit pattern with integer arithmetic into milli-units.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 .../ABI/testing/sysfs-driver-warp-mfd         | 19 +++++
 drivers/zorro/warp-mfd.c                      | 80 +++++++++++++++++++
 drivers/zorro/warp-mfd.h                      |  4 +
 3 files changed, 103 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index 8996d1961b96..fec712b8b9b0 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -14,3 +14,22 @@ Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Firmware and hardware version, as four hexadecimal digits:
 		an fmwver of 2027 is firmware release 20.27.
+
+What:		/sys/bus/zorro/devices/zorro<N>/t60int
+What:		/sys/bus/zorro/devices/zorro<N>/t60ext
+What:		/sys/bus/zorro/devices/zorro<N>/tarm
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Temperatures in degrees Celsius, with one decimal: t60int
+		is the 68060, t60ext its NTC, tarm the ARM co-processor.
+
+What:		/sys/bus/zorro/devices/zorro<N>/vbatt
+What:		/sys/bus/zorro/devices/zorro<N>/vcc5v
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Voltages in volts, with two decimals: vbatt is the backup
+		battery, vcc5v the 5 V rail.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index 61866f678b61..d407c786d44b 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -22,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -190,6 +192,73 @@ static int warp_get_status(struct warp_mfd *warp, union warp_reply *rpl)
 	return 0;
 }
 
+/*
+ * The board reports its sensors as IEEE-754 binary32: decode the
+ * bit pattern by hand and carry the result as milli-units.
+ */
+static int warp_f32_to_milli(u32 bits)
+{
+	int exp = (bits >> 23) & 0xff;
+	u32 frac = bits & GENMASK(22, 0);
+	int shift = exp - 127 - 23;
+	s64 v;
+
+	/*
+	 * inf, NaN, zero and subnormals all round to nothing useful here, and
+	 * so does anything of 2^23 or more: that is already past what an int
+	 * holds in milli-units, let alone what a sensor reports.
+	 */
+	if (exp == 0xff || exp == 0 || shift >= 0)
+		return 0;
+	if (shift <= -63)		/* smaller than a milli-unit */
+		return 0;
+
+	v = ((s64)(frac | BIT(23)) * 1000) >> -shift;
+	if (v > INT_MAX)		/* a shift of -1 or -2 can still overflow */
+		return 0;
+
+	return (bits & BIT(31)) ? -(int)v : (int)v;
+}
+
+/* Render milli-units with @dec decimal places, rounded, as WarpDiag shows them. */
+static int warp_print_milli(char *buf, int milli, unsigned int dec)
+{
+	unsigned int scale = (dec == 1) ? 100 : 10;
+	unsigned int units = (dec == 1) ? 10 : 100;
+	const char *sign = "";
+	unsigned int v;
+
+	if (milli < 0) {
+		sign = "-";
+		milli = -milli;
+	}
+	v = ((unsigned int)milli + scale / 2) / scale;
+
+	return sysfs_emit(buf, "%s%u.%0*u\n", sign, v / units, dec, v % units);
+}
+
+#define warp_config_sensor_attr(name, field, dec)			\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
+{									\
+	int ret;							\
+	struct warp_mfd *warp = dev_get_drvdata(dev);			\
+	union warp_reply *rpl;						\
+									\
+	rpl = kmalloc_obj(*rpl);					\
+	if (!rpl)							\
+		return -ENOMEM;						\
+	ret = warp_get_status(warp, rpl);				\
+	if (ret)							\
+		goto out;						\
+	ret = warp_print_milli(buf,					\
+			       warp_f32_to_milli(rpl->diag.field), dec);\
+out:									\
+	kfree(rpl);							\
+	return ret;							\
+}									\
+static DEVICE_ATTR_RO(name)
+
 #define warp_config_uint_attr(name, field, format_string)		\
 static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr, char *buf)	\
@@ -236,12 +305,23 @@ static DEVICE_ATTR_RO(name)
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
 warp_config_uint_attr(hwver, hw_ver, "%04X");
+/* board sensors: volts to 2 decimals, temperatures to 1, as WarpDiag shows them */
+warp_config_sensor_attr(t60int, t60_internal, 1);
+warp_config_sensor_attr(t60ext, t60_ntc, 1);
+warp_config_sensor_attr(tarm, t_arm, 1);
+warp_config_sensor_attr(vbatt, vbatt, 2);
+warp_config_sensor_attr(vcc5v, vcc5v, 2);
 
 static struct attribute *warp_attrs[] = {
 	/* RO attr */
 	&dev_attr_boardname.attr,
 	&dev_attr_fmwver.attr,
 	&dev_attr_hwver.attr,
+	&dev_attr_t60int.attr,
+	&dev_attr_t60ext.attr,
+	&dev_attr_tarm.attr,
+	&dev_attr_vbatt.attr,
+	&dev_attr_vcc5v.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 366848545ea4..4fa09fa972d4 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -84,6 +84,10 @@ struct warp_rpl_hdr {
  * Reply to WARP_CMD_GET_DIAG. Fields this driver does not expose are kept
  * so the ones after them land at the right offset.
  *
+ * The board reports its sensors as IEEE-754 binary32. They are kept as raw
+ * bit patterns because the kernel cannot use the FPU; warp_f32_to_milli()
+ * decodes them with integer arithmetic.
+ *
  * turbo_level and tz_corr_secs are reported by the firmware but no longer
  * maintained by it; treat their contents as stale.
  */
-- 
2.43.0

