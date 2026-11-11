Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415067;
	b=JquZshKsDG4cdqjvlQFiYNhMLNW0jmwooJC6rFqPnqg0DQeSVDiuKXzzLDwLpnQg2yIh
	 yogxpldSzStpfIJi3mBbRuZ8MNKYJRKn1ZJrnkUoLFeu4wv4UWk7oi2lOJFwVQiiWSEVz
	 ryzNHtAAUscB8vCRZch+k13oWHQlOvb6lQedkTRik2EU8WeZiwmFxapMY+47B1ZHKhafq
	 7QNKNZDfSpNyWD8IWVusGf/aykIzK1kF1r5hDt8lxx1oXiXnggmnM7KRzSebYZpJkoYmY
	 ytRKk9iCuJkCgLS273e0cPX2P+pKBMBYVXCoqGC6PrdcKS2y0QJk3VXb1T77eYkpFYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
	b=r/U02ZwqSJCjeDyy2oYkMbQKaEnIl1401gp4q2wgE6er5ZvK17tgwBlBiUa/fow2AliH
	 U4teo+TdRxchyYrIpW8m6WjOfkzGfAT/wEJifIZVDhgCh2RVXiRYLpS/KFEtG63zJ/Z5g
	 jhofiAfI/Os1VSlhBApH/g+D7jJrWC1cMrVLpCwFf+HMhnj9rXDJvXrfUjjL27vN2tlCq
	 lCXde5B9uzkXa9mO9mAhTnEvvVCn/maR7KTn1QZH5oF/jaPCgkJv/fLyM1cXy5+5NUCVJ
	 OhYo03xlJq1eEC6vd7DYvfOAQfGsnq0y3BKaWUHwKd8guMY7SZ9EljPzjToaRI8isdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWtgcY+D;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4060A2619
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD4060A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWtgcY+D
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2987980f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415065; x=1795019865; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
        b=SWtgcY+DaJtyjywvJOUsA8f0cZniZdWItVytM7IQ3xtO3ysPkKkYhtVuKbw4VsV6ET
         teXoMoYYxZiwaYZWc870bawhhy0t/dY2oCcZW1XEbWQuax8xdXMbN/IhQcLQuLlPAHF6
         ZEbDubOTbzNsAhCSKpNA3OrN9npePS+xpQgNVrmX4h5OX2WCZB2YoRIf69SS8yJTlPQv
         88JQptXpIg0m1/a6z2qLzvv+7IsV5kcmhtx8ztWj8qlhaC52uWtXChgkRugho2aU3GNI
         kRTwzVcysVTUrHgSBgtI6yrOl1xjYGNtEnGPBxCsaju2Vww3xinxEIGaOxBoNkbtghWA
         /4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415065; x=1795019865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
        b=uuM48n5GSFz+xIaD7MSHS93idDd5hkOxFNYM6MwcaXXBnrUEGukwM5DAh3n4M83Vib
         u94uivjgiS+YxdgG99EvhHfWhdLWKiZw5Quq0adewQyQwZwCOHfz7NDszme6c/zklimL
         r1ceLU9qefERO22poP3r80NEqCM/U4BTpPjZh0nlSL20Ejtp9sm81QLpSZOx8guwsEU1
         SJO6wG//iCYkOOL3fl1LHQ6+llGuRGIh9cCpQcd5u0DUHdIG+ddUQzUltlD/OkbGgQ7X
         +CSYMOrhGw5N7mm//jP5Nn2mOWyPnnGHj+NT4HpRh2Qp4r/DDaPB9CDGNWqKEFe+P0d2
         iMMA==
X-Gm-Message-State: APuU4Z9v5oA+iQ66HpLfvQ5UNmxDxk2eOxhsohox5Z4wOT8hSa2Xf4vK
	SNwtbeDoG9n3CqSDk5Jgl1nQ3itAvOj7L7lWZt9VnADWmvvyY8rzvlcX
X-Gm-Gg: AYBFou3x4rVrivBSJWD0nmFeYBAEffs24q4jwSfFkPq7ZtdPWRpIVSzBqBkvq40f/b4
	2qtmgzaK5JDc/fPu+B4fI9PlGCCRBHM1YDmBfzVSCjVXFRvunaal7ykZ60oQ3QUEHRlCn1DkLTN
	tJKxemgmLDo8C7rkBk1JD407a3wjZv8ujrJK2BwSCq5GLwLzMKCQZvbmIYfLGzffziuj7FuNcdD
	zB3znBMJCQwbPNATjKu38GZ8F9lXb9BRmJxRsEeTaMhQQIs3jC+4+BGyfO1YxZ95EPsfhc/v8yu
	e8nJQIfszsxuDs4ujTKbsBiUlRaoBTPN6/ANxa2zaEzDV5iOmfk8CJY1ZZdeuA+NLiiDAefuHMj
	mbTVkqhKXsGGRSH1ABc8UAi5sr76OxZv/sRwFK8V7ztcAL44n1mP3oEmWyksMf50RWPms/arfIf
	7PiUKUSJR9Q5IG7ru/cN9cEwTr+ng7wvk8BwMCEkmwzbONqtnvPCCgUfGH2K5ifKg751xjuNVnp
	j1oqY8Bq/dLFIcDmIQP8UIupNBWY/GAa5D/GLSIWvzmVBnzFl5w/jKqOcEoqNzatIVQ4MGA4oo1
	DSGvZFmcHIfhMNJGqH+Ctu8pSv0cQeoJwIf8U1AK/kpbgn0S+zn6LLfZdwK6U9uuJ2TAoMnCc7U
	Ghcx8xkXLviXv
X-Received: by 2002:a05:6000:230f:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-499c69cae4emr5038162f8f.18.1794415064910;
        Wed, 11 Nov 2026 08:37:44 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm12200583f8f.23.2026.11.11.08.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:44 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 7/7] zorro: warp mfd: expose the Kickstart slot selection
Date: Wed, 11 Nov 2026 17:37:34 +0100
Message-ID: <20261111163735.227286-8-p.pisati@gmail.com>
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

The board keeps several Kickstart images and the ARM boots the 68k from
the selected one.

Writing kickslot makes the ARM reset the machine on the spot. That is
how the board works, not a crash.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 .../ABI/testing/sysfs-driver-warp-mfd         | 11 +++++
 drivers/zorro/warp-mfd.c                      | 49 +++++++++++++++++++
 drivers/zorro/warp-mfd.h                      |  7 +++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index a8213affb153..8cb7df076e15 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -40,3 +40,14 @@ KernelVersion:	7.5
 Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Fan drive, as a percentage.
+
+What:		/sys/bus/zorro/devices/zorro<N>/kickslot
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RW) Kickstart slot the ARM boots the 68k from. The board keeps
+		several Kickstart images.
+
+		Writing a slot number selects it and makes the ARM reset the
+		machine at once: that is how the board works, not a crash.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index a438faeaa232..637ff4eccca3 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -23,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
+#include <linux/kstrtox.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -302,6 +303,52 @@ out:									\
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
+			      const char *buf, size_t count)
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
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_RW(kickslot);
+
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
@@ -324,6 +371,8 @@ static struct attribute *warp_attrs[] = {
 	&dev_attr_tarm.attr,
 	&dev_attr_vbatt.attr,
 	&dev_attr_vcc5v.attr,
+	/* RW attr */
+	&dev_attr_kickslot.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 4fa09fa972d4..6bc7b38b5e4b 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -59,6 +59,7 @@
 
 /* Command opcodes. Only the ones this driver issues are listed. */
 enum warp_cmd_id {
+	WARP_CMD_SELECT_KICK	= 5,
 	WARP_CMD_GET_DIAG	= 6,
 };
 
@@ -72,8 +73,14 @@ struct warp_cmd_hdr {
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

