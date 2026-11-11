Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415066;
	b=yjFMtCGr8jGuYsF1UcupTk0RpEb8i8XN5GXNsMOvKhmM7PquPTWiVI/229OMWgceNCQX
	 7Kg0yDDUYO0rc0IqI7haCg7utssG71TdNt1W4/BQry2YGhhocS/65gAYzZlAEjcD8l813
	 Mr3jP9rSKrDzruu8Z8eSjdKgwEcK0npV449SGMfbG8DKTsqujvd7igt9Kbsambl0BAeoD
	 YN4Y3y+Rj5+XLw7F2ksfs4y1yoXumv85e6zjXR9ABRWpS2XryAV44fn141ON8DUpznHMC
	 AF6ibNr/NpOvla72CAgen58CSHyEoDKWiw6fInZgTOBVvmnvTmShDZTNztA/eB0/4yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
	b=d2BKDpkkwrBpU2dAxFtzY22GkiJLjjyU7hAXnoFnUzCTOZJ74U8lKmLm7RPyUB4843cH
	 HbjXZOzp14Kw0Ty5Z+3XP+qKJCA5mN/uhhuO0Ryd/cgx0JhLgNN8JLC/oAifU8W7N/7S1
	 tZ3oqU0nld01LDjfLgX6/xB5UeDJK5SZSkL9x1UtSNirlgEpilXZwN1ORGUduZu8KTTiM
	 jMagcRQ9VJg7o9XqSabWeGotlzaGWcyd+30uApHm6mKFr8LkKMRiLzRGaZzzbgEiMunm4
	 tolHHHMHQce2FlKyPL2MvP5YDjSuCnGhrAnKBLtMVQULdmdmAQ/eXRiNmx6EJANQibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehKyMP7c;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6010606A8B4
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6010606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehKyMP7c
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso26034625e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415064; x=1795019864; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
        b=ehKyMP7cJwlLj/QYt7T1giOhaKbSDexTibivw04qgEeXrkjcSsDSj+YSsDILtE0dwf
         pLDjMaecDQjXq3NzGtijYVOucjgRdHChRAPcwqSrgW9dU2lAHIN7amrL9NMyORq9Kip5
         yr7np1vpxX1LW9KvbXApLVnavZLKWR+3FDB1v43lbgbKO2u2PxMN4FumE588lsryBW0v
         7tbYoL/QQrYudCWpd58ypFBsyqbJQoc8YxlEIX02A5spbY7sQIpAkPgtwmMrW2eMbGRG
         hae1YEgG0xt3pHdaWQNP2F1xRXWgHavA0dAJK+YzJkYMTpkYg6MWvRD1ncVAQKVVtblU
         JbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415064; x=1795019864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
        b=D/V4Fi3hFHXKxyTf0Jum2ovVBq50Det1QvsPtdGUkUOVJmCU/1KdL2ajJLd1FIxgDe
         Qwg1RxhWeHzBQqdsxOXiI6S115JTX1ntbbrTpVGyURSP/FeCxzbvWo7GSAfc6bMuZUXu
         pdk+SXaaFdBJwojwPmf30dYnec1Z9gnsYXSsLq1tri/A1xtmYS29JZ6UEWBKekVAqUEl
         XI4JwiAeKZuee2OVZi5HZJ3gBBPbUccRTS5/3n5N8GKnWyMgoLk0BYRYJ3MnYmddOVzc
         Y1gKDvrN8slQ7D98pN7TYmlJjhNPyBlEFYTvvgrIDdfiMiXCdrZQmXztzdT4B1+k4fXV
         9Q5g==
X-Gm-Message-State: APuU4Z97ccGzFMcohAcEAVslTb04N2mC4Ncnk3r+bwCvRV7H+qrbb2B7
	NJ3us1j1FjsrAalqTlTbPB32ilGnkKtZeK2x333AoUqNPzBgE9xtyA0w
X-Gm-Gg: AYBFou13Ct4U82hzXlUqopDijZ9hRzGFVK4ILkA65RY12yG2JjEkEU3Art03TDUuStd
	+2jBc7VKzRA8Q2JOqeP0Lx1DrvHYwXQaF8ayXuJV9llLCxxW43oRWfpqZAUq8KKwRohuKpe7lFv
	pVvX/fP/pmb9xhmP04+4yPzRllUKmI8m+cr2smUYuipR2F2lsDJ+cukUMx3oINDw+UUcQuw7qD1
	Ymd4qn1Qr/uZpHZ6Bx98UG16fYJormKeZSkTWCFP0S42UF609EsM0pGWpAllmT0DiEw8Rrcukva
	bC/hwVGDUZdft7CbsfRt3gNID4OZoaOXjxrsR3XjSI/MeInGC+hsXwrk4wGzuk/WvI6gSrc25u+
	fPXcpqjnnfm5s8IldT1WYYpkkzc2H05P9JJpZLTZCU/XreCtDTez0Xw1FYl52aoqtb5z+0PbPPZ
	zqPF9Pdp7lDwAqivdzVVdjxclNqcLRgwN0SJdp9N72BsWYOE+bbIFOGxztVR1tUBBmYHW9ZveL2
	cILUW5EfZSX5OfExMzQXWQakR3/7y/SR7x5Ed+6vk6ZJiVuGKWVR1olfWe3RO/ZoY0EJskTj+aO
	lrQBFB1iMfYVdmlgLQZlvRVxevOFnaomU4GmE0fyuzzb525+qVQyA+a3KcDYMBHSZ0tNvJFM9Wl
	b2OkqtsQMET+O
X-Received: by 2002:a05:600c:468c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4ba0939b3eamr53551675e9.25.1794415063769;
        Wed, 11 Nov 2026 08:37:43 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm64559995e9.1.2026.11.11.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:43 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 6/7] zorro: warp mfd: expose the fan duty cycle
Date: Wed, 11 Nov 2026 17:37:33 +0100
Message-ID: <20261111163735.227286-7-p.pisati@gmail.com>
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

The diagnostic frame also reports the fan drive as a percentage.
Expose it as fanspeedpercent.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-warp-mfd | 7 +++++++
 drivers/zorro/warp-mfd.c                        | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index fec712b8b9b0..a8213affb153 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -33,3 +33,10 @@ Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Voltages in volts, with two decimals: vbatt is the backup
 		battery, vcc5v the 5 V rail.
+
+What:		/sys/bus/zorro/devices/zorro<N>/fanspeedpercent
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Fan drive, as a percentage.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index d407c786d44b..a438faeaa232 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -303,6 +303,7 @@ out:									\
 static DEVICE_ATTR_RO(name)
 
 warp_config_string_attr(boardname, board_name);
+warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
 warp_config_uint_attr(hwver, hw_ver, "%04X");
 /* board sensors: volts to 2 decimals, temperatures to 1, as WarpDiag shows them */
@@ -315,6 +316,7 @@ warp_config_sensor_attr(vcc5v, vcc5v, 2);
 static struct attribute *warp_attrs[] = {
 	/* RO attr */
 	&dev_attr_boardname.attr,
+	&dev_attr_fanspeedpercent.attr,
 	&dev_attr_fmwver.attr,
 	&dev_attr_hwver.attr,
 	&dev_attr_t60int.attr,
-- 
2.43.0

