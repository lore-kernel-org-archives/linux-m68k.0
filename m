Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603766;
	b=PHnKfPdocN+hbtnJNmUhYwfX/wzdtgCUPwQ/7nCCX6eeVSwr6ZZspbs6j0wHimW3d0zH
	 7DNe7c4sPPGw8eVmqNpXib/6O03ycW8gTBsffXAg6Oo++ObijNLk2zKKTAHb/pimDd4Zv
	 bH3W64f7UFEAnmXzZlGE45lD07dthdyKaQoiHZExBC/+Z/dX/WZNy+4zCG5FmHAxANARd
	 ezcBwPoeTPAcubU52FEJRjRMYr0VRXUJF+WM83Q1gn4uCI9dtNlDAYfjXMAY6ehrB/Ctd
	 pBYwN4TVuEzxVWXZ4Pp+rSjeEcM3cT0yNuu/9YW9OP0cgklEmWNyjLdgXApwR9uRg4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oQSq+NWanu9Okqzw7UWIZgz77lW81LmDFzn8lJhqTiA=;
	b=yQtIIolYeeUfaEgwH5r1RooQmt7sZsXsFyRp8QFIb+7uoDzAptyIQ0MRQqT7+FlVEpYI
	 uF8AID1FzYTOAZRSNTdze8RggyI0MO1SH26dwqA1cfWmXhhF08qNZKUg6NMHezwzlhS4Z
	 0cyNQMduaXx6QrEnoZo+MF8zgK6dWk6G6Uf7I33bTGs3OGss9UFe5//iTmZvR1pVmz0Ij
	 0qZn2ntCxvoLmATOvK6WQyB8sy7Vw3+BKTbDzxDgxtnwjnoTIO8UwroJiSKyewPavkZQ1
	 Q8YviMmC/EUtDTqIZWmSooJMSru62Op7mKbAjIXnfr1E76YU7afqe2dvcMcsPchActg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+bdAKVM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB5606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+bdAKVM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso11115945e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603764; x=1793208564; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQSq+NWanu9Okqzw7UWIZgz77lW81LmDFzn8lJhqTiA=;
        b=o+bdAKVMyyqxLN+1Rfabz2WElobqt2GQGRG4UEk16TePA64ewCC0myU/Pc8fo6oI7u
         Lr9rV3jqm+EfSwNSjhj+70FqHKfaXb4X2MAWQU0aGo+KVUcqhgO01sux2scg36qgIcDE
         79QGxEKvyCWZzWCpJkx4AVmlUYcBlvT9mQDY9BXoG0JyHKtdOx1YyTLUlRWkyB2fN0lu
         diy03jSugIhUjMjh7s299m5oKIGBcV1R7KEwqbjpv8v5fVQZyfY284NJmVa9cc3+drgj
         tkTTKUcG2dJlM4ymGOWj5dxrBlOWNO8mYAyaD15wcJ3RxH15uTJQHxfNi/Pgz7fN199p
         Spjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603764; x=1793208564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQSq+NWanu9Okqzw7UWIZgz77lW81LmDFzn8lJhqTiA=;
        b=G3v8id48iPIzq2xzO6IwN/JAjF07bOeIJlTkGpO0nURz2wcp1s+R/cRMZRBhxDJzEa
         NoWsWpI9P11CDHEiWib7IfM5V9UvpB9G1eMncVY5Wc+aWeaBUq+UU44bjLY1IVCCYfTK
         ghXJ3YJ71FmZCgMbwKjxoLLw7KfSCaB6vWO5ck4ai33Hr5gFYJX4/lFqDiTVLbGNm+v0
         5MSQdYkVdcP8EFdvo2bn6FvUrj9quVnfC8INu1Q8Lwp+hXTfn14owQOdRUvOEXjuwb95
         EsaWOW6bZzOkV2rTMK+uAA+6jebc3ZI47qdBD9eip0daxFHlUtVZQUNeF6evViC31nW9
         +Jpw==
X-Gm-Message-State: AFq9FYKcQSvr6jefD81pCyp9i7jTxT8a36LV3wSygCpNLZDOgQVbhlwH
	OVHAb2gGlvxYYpEY64hdhdv37HW0HkAUMMtI8ubAD5zCi54I6EEPjXaDcAwEwg==
X-Gm-Gg: AYBFou2uxvox9R5JjHAXIyu60iqC08agK9mrmJDbqA4AaJMcz8cEcFtXfiY/kkrSSgu
	1qVlmHBYgtONbNhZyDSyIF5IIBHR/iH81iAWiLbBH0LjUCVsfd/kLyvyZIXAFYElbFy0AoeiaPP
	ZuPANVTapkbUTlteOFfEqF3VcMY4IfRfx5ON3j3j62E2Rkxbw+rNjv5zUu+QQFQEW5UwjDN354o
	zNiWicCN+pJCS6rsbA7QHCPEnCLI/koNuu0uOUN0OqZ/BJWmVhasoLTI5y0AyZl5syX45RqFhFI
	8y/9l0D7bUVNFPflQmEneMXg+8YWmZlUbOns8Zse4wRzHoeIauKog/+v8HOMPn+zFojEEz7Y844
	SdiWie38xeaZHJz81ePPxBW7hdcKiI03YC6Hfl5GsG67pl1nn0KSJqIouhGFcIvvv5iply0dtbE
	2W94F2WKsNG7noqkztxGdZ5siXJdD6UdTfNdUbXUwaXvqIlOksVlgy7qhdJUHPDMZhVJ1ZXi6SR
	lPN97chW509T4EtwZESRuflvtH3lWf4vXP30kmq/85YN/B1EOInceRWtlKbl13nbq1L/hN4yYud
	i1pAVrLIRZXtPnjrMDxmR8Y0anfxaMCwnjc6deA=
X-Received: by 2002:a05:600c:e555:10b0:4a1:e284:21a with SMTP id 5b1f17b1804b1-4a1fdb1c4f3mr42847625e9.24.1792603764151;
        Wed, 21 Oct 2026 10:29:24 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a38d08sm8411345e9.10.2026.10.21.10.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:23 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 7/8] zorro: warp mfd: expose the Kickstart slot selection
Date: Wed, 21 Oct 2026 19:29:09 +0200
Message-ID: <20261021172910.134838-8-p.pisati@gmail.com>
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

The board keeps several Kickstart images and the ARM boots the 68k from
the selected one.

Writing kickslot makes the ARM reset the machine on the spot. That is
how the board works, not a crash.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/zorro/warp-mfd.c | 48 ++++++++++++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h |  7 ++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index dcf13e31bee2..78a3d7e59320 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -295,6 +295,52 @@ out:									\
 }									\
 static DEVICE_ATTR_RO(name)
 
+static ssize_t kickslot_show(struct device *dev,
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
+	ret = sysfs_emit(buf, "%u\n", rpl->diag.kickstart_nr);
+out:
+	kfree(rpl);
+	return ret;
+}
+
+/*
+ * WARNING:
+ * changing softkick slot will initiate a forced reboot - your Amiga is not
+ * crashing, it's the ARM MCU that is abruptly pulling the plug
+ */
+static ssize_t kickslot_store(struct device *dev,
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
+	cmd->hdr.cmd = WARP_CMD_SELECT_KICK;
+	ret = kstrtou8(buf, 10, &cmd->select_kick.kick_nr);
+	if (ret)
+		goto done;
+	ret = warp_exec_cmd(warp, cmd, NULL);
+done:
+	kfree(cmd);
+	return ret ? ret : len;
+}
+static DEVICE_ATTR_RW(kickslot);
+
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
@@ -317,6 +363,8 @@ static struct attribute *warp_attrs[] = {
 	&dev_attr_tarm.attr,
 	&dev_attr_vbatt.attr,
 	&dev_attr_vcc5v.attr,
+	/* RW attr */
+	&dev_attr_kickslot.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 8a9e7f306269..0633accc980d 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -57,6 +57,7 @@
 
 /* Command opcodes. Only the ones this driver issues are listed. */
 enum warp_cmd_id {
+	WARP_CMD_SELECT_KICK	= 5,
 	WARP_CMD_GET_DIAG	= 6,
 };
 
@@ -70,8 +71,14 @@ struct warp_cmd_hdr {
 	u32	cmd;			/* enum warp_cmd_id */
 };
 
+struct warp_cmd_select_kick {
+	struct warp_cmd_hdr	hdr;
+	u8			kick_nr;
+};
+
 union warp_cmd {
 	struct warp_cmd_hdr		hdr;
+	struct warp_cmd_select_kick	select_kick;
 };
 
 struct warp_rpl_hdr {
-- 
2.43.0

