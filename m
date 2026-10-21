Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603763;
	b=bs38XbZE+h91xlWZUq4fQ7D6kUvLsyKl7kmdwyDO/mA9BGFJ2faKfrxbZfQVORG+KCh6
	 IiUJkKVWY5JtLnWv7U0IqYJCMkG6UhPvE+An9SiJuSy1ofA67QU19SauZJC7gw14Y5z3+
	 pFTAkh+KdcKSosSBY7vBcGVB8SiSWlVIJ47b8GgTc35XH9d4B0/t2lkYi+zgrNW34We6K
	 JxTayEUHLckGOpRtkS6mrz7JHen3+qmy7dK0BcJkqY2quQRvqd0ZjOfpJ2K14YPOmMqHM
	 FOt2waaTdGxbrf+9n7u/vmEdcVzl7FiRfAqREOzDSQ9NEhOADGpRAJFY4zGybtB00yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=36yRIKw7hs4qCS+KaF8roioa1E5mL2J9BSNuDJMDz1o=;
	b=NVB3ETnZ9byAPDnth47d/iM9nm3kbSVA+qzflWIgZeo9DT8wmbUw38idFEDc1yfXvVzE
	 oq7CYKe2AI5nfsPNoDMPMCz3Go3KBMTc0CIpnWNJ0R1iMXZWjM0tDHbqIwcSVGSwxEbSz
	 qtWfLa6gRLCXD3EkPIogKtMjRSylWWencsWfEaI7wOl3HDotbDiucyucXyCZo38LiSCCc
	 CJfgs1Goz90p9xknth4uSy8QEgWTPLEX/GQnSsTTmbzMnKG/2jyMAXd7Ask5tliWypXBq
	 Ked76G+YObngEp/TAaBWvi0fSTbNLDUjw56uJhExuAf+TdQ0GSm5tMuLHAtI6BUkFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IEN8IR3n;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D036F606A331
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D036F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IEN8IR3n
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so5843225e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603761; x=1793208561; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36yRIKw7hs4qCS+KaF8roioa1E5mL2J9BSNuDJMDz1o=;
        b=IEN8IR3nArhfI8ccIR9zgxGQ6az2yxZnla81EU6bNT1kF6o1gGY2r6pFHyeAV3Zfu5
         Ak9wSu9J1BBeoiDDYmkaWyLCzt6uRtJWh8qWXk1LyEUY34w1B09XTPlQPAn58DRtgmbj
         kdieuvx4/Ye+b8lgPzcwIhF1YL9AKCoQtaSoWpmItWziqHL3KSE1pZvgwNrgGLVnaerU
         wS+e8R0++MVOazVyGpwfLqrWi4D2K7p4CSUzBwPmErWcMQ9PDLaQd4z22iUpJzCiSdNZ
         oSPmN+8Or0GRZkEz0yQeNtRzSrqM8fA2lsNpIVXq6uHsX1oM9PyMQoUnMNNI8liONOXI
         daeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603761; x=1793208561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36yRIKw7hs4qCS+KaF8roioa1E5mL2J9BSNuDJMDz1o=;
        b=RFDh3KkCAAZtjs9Zbek52qM9P5KW47NtWZELiX3W4u/qAkISk715F4mJjbTTFGpM8f
         ttXlv1K994olGW6/A2HZlIFWuH1W+JIZLmKYUCxieKq/TxZREE+/uTh/1gFdo3T2MbSL
         M/M3o39Do7Saaj/4klg0NbXTkUwXNdUx3Ogwu7wFP2FuqVrf3bI2fXKTgbPCZBC0dDaW
         SIXyCVoH+Je9lXqz7GjhtXUr0NZg+PXu4+SBXlDLjrSeuMz+26OnvtSyi003vxljcr48
         IjAOrnffl16+4Y0TFMFSYx312OWQgVdg/xzzjDbkG99Ya2zf2pNkg2e4pT6MtHnDOTV2
         SMEw==
X-Gm-Message-State: AFq9FYJpM2PfkXx0QArzrvpm6bMofiK7bw16RyPnOyIrsKq4/sewMdtY
	HBfw3IIpbNzTzPwtF2J9iZ0nfaDC7O97rj92x7YH89Yqq47YYaCPVrASP9XA0Q==
X-Gm-Gg: AYBFou2xR9zkGRYVDr+gT2lLITyWcbJpOu/ThV+G4CE8ZtmCVYhQ29IwsABgxoeE0FV
	VBPbvuk7Jafu2J9Zrp5MWrjxXnMDT3vDmCJgrztXV2ALMCxYQqN5JHObgzW/Xia8wvmtyOxOm9/
	79FqvBlYBJCAdKWYVjiuXV4bSo8pTYMVrgqhjIMcpTEAwjSoIieLX0BzlYycE07uLW54QrSLrfb
	W68lu4kwuTvMcHX0P/WXZMAEETDz0KvbgMtICKOTiXAcqHY0uy3p7mm8AbyZsaFR/xX6JUrFwIm
	a+6bgL6704/az5paUA1xUqhzkRNlI3bQTbEp/4LWPiOnsWM2UvC28vL98HPhrdOdw7NxYlNiKLK
	w+DNhdoCLrssWJSb2bw1Hqboufvzr1G1w9MMsZBzaTRfHW67Iu/fThaDBib++QRgjEG33qXlMx+
	eko8mCZK1L9Us+vFBKP7ljJLXMSDK7ZMp5EyPWOAHRxk7gJ1d1VKCsD7wDoe1MGYK+rMatMdu3w
	tDIJj83ASknbr5t+gBVl7dJ2cjkVsOptMgJFaH502TqcONMpzheUhtzns6LwvqdySvQxSizsZZb
	2jtUDKpXgckXSWgzBf1TMwr3tpINLQiOnMf5ajvL7Y/xrd84UOyIYwF4NWc1
X-Received: by 2002:a05:600c:c4a1:b0:4a1:f0bc:90b with SMTP id 5b1f17b1804b1-4a1fdd3d407mr60455195e9.29.1792603760924;
        Wed, 21 Oct 2026 10:29:20 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203add648sm6413725e9.1.2026.10.21.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:20 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 5/8] zorro: warp mfd: expose the voltage and temperature sensors
Date: Wed, 21 Oct 2026 19:29:07 +0200
Message-ID: <20261021172910.134838-6-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021172910.134838-1-p.pisati@gmail.com>
References: <20261021172910.134838-1-p.pisati@gmail.com>
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
 drivers/zorro/warp-mfd.c | 79 ++++++++++++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h |  4 ++
 2 files changed, 83 insertions(+)

diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index 2c5b9254651a..1bd7c701df8f 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -19,6 +19,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/bits.h>
+#include <linux/limits.h>
 #include <linux/completion.h>
 #include <linux/mutex.h>
 
@@ -184,6 +185,73 @@ static int warp_get_status(struct warp_mfd *warp, union warp_reply *rpl)
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
@@ -230,12 +298,23 @@ static DEVICE_ATTR_RO(name)
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
index 14d8f9ddd58d..8a9e7f306269 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -82,6 +82,10 @@ struct warp_rpl_hdr {
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

