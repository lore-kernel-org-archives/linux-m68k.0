Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603767;
	b=lFA18v0s1kQLnWEdd1UsSY1kv1NGbqm9OnaZ5VkIlfLj+4wtbm/0Q1zfQcmVE/sJ4xb/
	 /g74TSwu24AhaIYPQu5eGpv3Hs2x0jbvhMZe5VT5RqXs1x/hIp9dIdrC4W9I+LcU7XzoE
	 W9Z40mPCWIn8WsWgnhq6wvQ3hDbChEtbbxaUWLGMQq2/7b+GZY5So/3lpWptvWJwve5eX
	 4q9iE172iFpFmqd3UztNEA2fefeTyRJACJgPgC9ExhpSBPeMUKHTWtvAdVLcBnPsCLPBo
	 ef3cKdAPMD8Wc5aia6G7EwS8CdbhBCAdSN0r3IiuZTsgRxbf09SRTgvAoR6jmomtH/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IVx21zaZ1O/8U1Wz+gp1y9JpLHoZp3WR+YSf4NbaHLQ=;
	b=1cYuLf86G4TewkAFhXY4Xk+uCg6YL71jxaqdcePNcyYPr3qqTowbIlq/DJFjhLxjGZJj
	 PC7MOFA9ZfvC59YcuFAv7HTJJiL8l64d0ljni98LLrWJ6Hp8JnmXwJAioVJcQppEvXoAA
	 Ft8mV5AyMoLcvUrl51c3d3mGqP50a78le4qO8IHT1aI2zO9ZeORY4TLEN5QZslyB/C3pL
	 0pxN5qrGXHo7SS+Bnztmm4Qh1MVvmtI9bFUMwUv2/07mixeTlzYBb5IMUPAd/I2hErAsh
	 H5FUJRco5fmEkwrTy6IEZJPYrDDphFldizdsuKe2BIATHHb3zlkFY7Hos3DOunQ9aAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IVIj7iGu;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCBF606A32D
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCBF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IVIj7iGu
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so8409975e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603766; x=1793208566; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVx21zaZ1O/8U1Wz+gp1y9JpLHoZp3WR+YSf4NbaHLQ=;
        b=IVIj7iGuuawNJ7oubGlwxoo8sd4bNEnxij3kU8bB0Y+yr6akee49Yv+2Z63XS6p0QY
         ZAwTrR3qrKucju8AG6pvvvAqED8QXHg93q929zPpV/kkzI4ZWCNEcDqqSCDmKeDK5pEg
         MgU5Jq+/vzBWah3yK+1/F6aeMbBh6EY52Xq1btB96i0Tn2PLodCuGCRkNri04K0WsZg6
         GF5pPu7CWbgaMNkgfOMEyPFUK9och2x0/0m8tMlU2TBuIF8xeHUwKXOEX05VQzayOd0d
         NjwoP4/krDYKuHxBavT6lFSbv7p93ILF3PCgph3qI2TYDESSWOHxIsQKOvucfJgxLSgn
         47fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603766; x=1793208566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVx21zaZ1O/8U1Wz+gp1y9JpLHoZp3WR+YSf4NbaHLQ=;
        b=vyKGA7S8bnrWJMZS7rTileRPLsrOkhsf2cyfYLIC+bVAZ3f8sAPTfk/ao4uaFIJc9j
         zKaThzDYAk6zCRfg3BWhVB+Ge0ZrjpZHuJkhAFcu1Mu9ixUe3LZez4NUgzW/PQOT+5VT
         z4PVHKGnGHYhUiXwpx8sbT+NTwrmABkavvbvF7yEhO1DnrIthbFPwZpFCVBdflh38tvA
         udaHE/ZWHEcKJ4v76tZDFEPNL8hMUO0xr1VTx8+2fnM1frMTMaM39RNmGTXE/iWipLAS
         bhDarCn2N22XIPCTFucCsIe1GlvDfh9yr8QhrTeon5umGeH7z0n/LS9nPQpp2621QnNN
         4ccQ==
X-Gm-Message-State: AFq9FYJTY0UgSfofn6F/xVkP3IAaSE4F5nHBXmMY/LwKVrPYiRdPZStt
	tSDNdejgF3u89m+G22X0YLgRn4lZcn06NELI8it1Y7PN79BI5L5UE3dMw+w+1A==
X-Gm-Gg: AYBFou1sg2tXbxVTaHqQRgY4YFByVECgmP6frZWwi6LtD8m1RyrGW9jDxIODm1xCs3n
	m44OPIGrEsUduaZUUPSXMJVXxFNPR/JFyBFaO3b/mjl6PKJ49+qkqSWyvegO5BrY+A7iYMhah12
	uyHMEEC4fINFdiITzcZaJBXpxRjkuEtPVc8rEYFdPGa3m8BBUGJ9kQTiia+TTD+5aWbxCpmoYR+
	j119e9f+nJ0E5iRPIDSMkIDii3beJGH+jqsG3e5ADk2kShVc7mA37oqT1hIYfJzUbnOeUpMtdt5
	4VhXrbEU1RkSoIh9kGRExuA6j6930ZfwCM0/V5dsmN9sD4idaEKCdRrw2T7sTcg5ENYQcHAIDCV
	3CevtxychKDe78XBIbzXuO0SUfiXVHy4a94zJEOFx+0/XJXrODLNonC0MwkZeghHvgmBaSqynzb
	Ux+cwxGBJ+TRTOIx3iyTN970ltRhLwGqWs3ErcoGXCOqpInF+2UTGnRL1hbv/hyfgKy5fjOLQFX
	/sf/ggFduPrvcs7OdFLNSp4PCNb9YcnR1HdD74ZmyV1F2qM2zoPaC+3o62aRJNUCjyKiIMRyGo9
	NZV2y6o0jy4T61LlwoFWO3yNfo9KQFPkOYiL3LY=
X-Received: by 2002:a05:600d:6413:20b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a1fdd20c95mr44755235e9.6.1792603765612;
        Wed, 21 Oct 2026 10:29:25 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd13891sm45753625e9.2.2026.10.21.10.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:24 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 8/8] zorro: warp mfd: expose the WiFi configuration
Date: Wed, 21 Oct 2026 19:29:10 +0200
Message-ID: <20261021172910.134838-9-p.pisati@gmail.com>
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

The ARM owns the WiFi radio. Report its state and let the SSID and
passphrase be set through SetWiFiSSID and SetWiFiPass.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/zorro/warp-mfd.c | 131 +++++++++++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h |  26 +++++++-
 2 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index 78a3d7e59320..abe1cd686123 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -295,6 +295,19 @@ out:									\
 }									\
 static DEVICE_ATTR_RO(name)
 
+static int warp_copy_str_arg(char *dst, size_t dst_size, const char *src,
+			     size_t len)
+{
+	while (len && (src[len - 1] == '\n' || src[len - 1] == '\r'))
+		len--;
+	if (len >= dst_size)
+		return -EINVAL;
+
+	memcpy(dst, src, len);
+	memset(dst + len, 0, dst_size - len);
+	return 0;
+}
+
 static ssize_t kickslot_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -341,6 +354,121 @@ static ssize_t kickslot_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(kickslot);
 
+static ssize_t wifipass_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_reply *rpl;
+
+	rpl = kmalloc_obj(*rpl);
+	if (!rpl)
+		return -ENOMEM;
+	ret = warp_get_status(warp, rpl);
+	if (ret)
+		goto out;
+	ret = sysfs_emit(buf, "%.*s\n", (int)sizeof(rpl->diag.wifi_pass),
+			 rpl->diag.wifi_pass);
+out:
+	kfree(rpl);
+	return ret;
+}
+
+static ssize_t wifipass_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, unsigned int len)
+{
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_cmd *cmd;
+	int ret;
+
+	cmd = kzalloc_obj(*cmd);
+	if (!cmd)
+		return -ENOMEM;
+	cmd->hdr.cmd = WARP_CMD_SET_WIFI_PASS;
+	ret = warp_copy_str_arg(cmd->wifi_pass.pass,
+				sizeof(cmd->wifi_pass.pass), buf, len);
+	if (!ret)
+		ret = warp_exec_cmd(warp, cmd, NULL);
+	kfree(cmd);
+	return ret ? ret : len;
+}
+static DEVICE_ATTR_RW(wifipass);
+
+static ssize_t wifissid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_reply *rpl;
+
+	rpl = kmalloc_obj(*rpl);
+	if (!rpl)
+		return -ENOMEM;
+	ret = warp_get_status(warp, rpl);
+	if (ret)
+		goto out;
+	ret = sysfs_emit(buf, "%.*s\n", (int)sizeof(rpl->diag.wifi_ssid),
+			 rpl->diag.wifi_ssid);
+out:
+	kfree(rpl);
+	return ret;
+}
+
+static ssize_t wifissid_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, unsigned int len)
+{
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_cmd *cmd;
+	int ret;
+
+	cmd = kzalloc_obj(*cmd);
+	if (!cmd)
+		return -ENOMEM;
+	cmd->hdr.cmd = WARP_CMD_SET_WIFI_SSID;
+	ret = warp_copy_str_arg(cmd->wifi_ssid.ssid,
+				sizeof(cmd->wifi_ssid.ssid), buf, len);
+	if (!ret)
+		ret = warp_exec_cmd(warp, cmd, NULL);
+	kfree(cmd);
+	return ret ? ret : len;
+}
+static DEVICE_ATTR_RW(wifissid);
+
+static const char * const wifistate[] = {
+	[WARP_WIFI_UNKNOWN]		= "Unknown",
+	[WARP_WIFI_STARTED]		= "Started",
+	[WARP_WIFI_STOPPED]		= "Stopped",
+	[WARP_WIFI_CONNECTED]		= "Connected",
+	[WARP_WIFI_DISCONNECTED]	= "Disconnected",
+};
+
+static_assert(ARRAY_SIZE(wifistate) == WARP_WIFI_STATE_COUNT);
+
+static ssize_t wifistate_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_reply *rpl;
+	u32 state;
+
+	rpl = kmalloc_obj(*rpl);
+	if (!rpl)
+		return -ENOMEM;
+	ret = warp_get_status(warp, rpl);
+	if (ret)
+		goto out;
+	state = rpl->diag.wifi_state;
+	ret = sysfs_emit(buf, "%s\n", state < ARRAY_SIZE(wifistate) ?
+				    wifistate[state] : "Invalid");
+out:
+	kfree(rpl);
+	return ret;
+}
+static DEVICE_ATTR_RO(wifistate);
+
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
@@ -363,8 +491,11 @@ static struct attribute *warp_attrs[] = {
 	&dev_attr_tarm.attr,
 	&dev_attr_vbatt.attr,
 	&dev_attr_vcc5v.attr,
+	&dev_attr_wifistate.attr,
 	/* RW attr */
 	&dev_attr_kickslot.attr,
+	&dev_attr_wifipass.attr,
+	&dev_attr_wifissid.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 0633accc980d..1a7a50b6a278 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -59,6 +59,8 @@
 enum warp_cmd_id {
 	WARP_CMD_SELECT_KICK	= 5,
 	WARP_CMD_GET_DIAG	= 6,
+	WARP_CMD_SET_WIFI_SSID	= 10,
+	WARP_CMD_SET_WIFI_PASS	= 11,
 };
 
 /* Reply opcodes, as reported in struct warp_rpl_hdr::rpl. */
@@ -67,6 +69,16 @@ enum warp_rpl_id {
 	WARP_RPL_DIAG		= 1,
 };
 
+/* Values reported in struct warp_diag::wifi_state. */
+enum warp_wifi_state {
+	WARP_WIFI_UNKNOWN	= 0,
+	WARP_WIFI_STARTED	= 1,
+	WARP_WIFI_STOPPED	= 2,
+	WARP_WIFI_CONNECTED	= 3,
+	WARP_WIFI_DISCONNECTED	= 4,
+	WARP_WIFI_STATE_COUNT
+};
+
 struct warp_cmd_hdr {
 	u32	cmd;			/* enum warp_cmd_id */
 };
@@ -76,9 +88,21 @@ struct warp_cmd_select_kick {
 	u8			kick_nr;
 };
 
+struct warp_cmd_wifi_ssid {
+	struct warp_cmd_hdr	hdr;
+	char			ssid[WARP_WIFI_SSID_LEN];
+};
+
+struct warp_cmd_wifi_pass {
+	struct warp_cmd_hdr	hdr;
+	char			pass[WARP_WIFI_PASS_LEN];
+};
+
 union warp_cmd {
 	struct warp_cmd_hdr		hdr;
 	struct warp_cmd_select_kick	select_kick;
+	struct warp_cmd_wifi_ssid	wifi_ssid;
+	struct warp_cmd_wifi_pass	wifi_pass;
 };
 
 struct warp_rpl_hdr {
@@ -122,7 +146,7 @@ struct warp_diag {
 	u8			ide_ack_as;
 	s32			tz_corr_secs;		/* obsolete */
 	u8			board_type;
-	u32			wifi_state;
+	u32			wifi_state;		/* enum warp_wifi_state */
 	u32			cpu_freq_mhz;		/* binary32 */
 	u32			cpu_clk_phase_shift_deg; /* binary32 */
 };
-- 
2.43.0

