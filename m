Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603764;
	b=EZL77EqWJLuqkHrlXGlko+oY9Vn5+4FlGH+fYKDw+aaHX+0WvoZ6qhQQuA50KVT4L5Cu
	 BQA+cCNxcLlmYdjqHKhNLkQlcrXe9sW697zQ1j+HPvi24S4yeFckChnM+zj2LMGWnPzQS
	 z5v7ryomqIAhIt7S6dm60XbdPCcPbewiOFAkVi1cvgVfMkC1Ap2SfRbMgE9LaGE6nm2/p
	 5AjT4VTPoUmfbAg4BIge7JsbClraKq+UgCXbu5ttcODYsqcEurtq32nwp949qE6eBVu7j
	 VQ6SrMdI8WMZ5qQfubGmSQhtVKVYAJ8IM6lOgZEIebE9jBeJCwb1Q3XJqIiCuokqCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9T+LD7CXLl3KRpMKjiW/EVgOTVjMm7GxICn0E+Daqwk=;
	b=UUV/v8G0auLfZOsGCJiBp30y3C25zUxIsPNVh/oE/NaOjNgfNTU9BMGply2sSmrmz8tE
	 LqyBmLM4On27R1kR6nsomgXVwzQJMh0lh21JwdG84wX6iFTw90CXZtARnVteCVgUTcjdN
	 /Dz5IZOpuvSkVrFTw22Gdjz5OnBByJIXjCLWFauBN/AhTeMDKUj2ILJPo2J2t0ZpvVZnG
	 S1NQ8vuua6Fc9lNhV/x77LnP43EufyV7qZEHh0xHzG20nqmzn1L1rdjZO4MnWjugsEDtS
	 dAzLW6CjKUNGWaDvdYf4sbxyixxwKpGB6m28iP4bNP2me5F37msx8dDAcyiQK1bN38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IK2XipW5;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73873606A331
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73873606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IK2XipW5
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso731098f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603763; x=1793208563; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T+LD7CXLl3KRpMKjiW/EVgOTVjMm7GxICn0E+Daqwk=;
        b=IK2XipW5Em25W6X3ekulmatWdutGkFPHHZGMsZXAk5JwCBcpk8mFhTxOZlwxXuiBAV
         AJbkdEJFYrNki1xS1LZoc1c8QrnRNDCpEZTEenYgrb99N3PSIMsSQzbsJ63d874SyWmL
         kVKaC75k9vywbV7dSGMhUNP/rgGDuSit7x0k8pDietwAWS0TfZ0KeQRbxYSd65b6hxHJ
         W6WcYd9qFPoNfbogwwV7mDKvAMJ7qJoDr7LgvU4GwElfHBw3Gz6TRYRf7weltBXMGUXE
         Z9kmz0OSApkrHXV7NwEpV3ob0Xl2expAD78G5h+C4m+uiczLxVtkcdTZM87lZptEKbVE
         MQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603763; x=1793208563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9T+LD7CXLl3KRpMKjiW/EVgOTVjMm7GxICn0E+Daqwk=;
        b=YwWmGyn9LQzK5ZJ2b1iZTflNi/h9lXY6Y55lLTIc7A6g+91SrfncA6UMbT1a5utdbm
         UovkHeG0yQ1jjFXGdnUiM8SLnco3DEA6jCXfpqVVhN0NJiSOZzK44d+fuHw1SkcQnNA8
         FJlEQUbHY4ktaTEXQMrD6X78iYyNu+T8zYJgmuyzR5iPoRlp7TRTj0sSsQCCi9koDV2r
         ZgBZVMB93cInwJro8XAIxtUI+sbqAP4NSN3XSDOZ43tKU8H6Qzcoj9LkaEJSrRUyKXH8
         NK8pSyq19lJiAlNiw1ayur5waGe/QXT0uEWlnL9mb1tAMrNXj0khx3+rIQbA1cAOVOFU
         S1kQ==
X-Gm-Message-State: AFq9FYL6PrZf9SXJ02skY2q3MPWz0zgKICjP3RT86L2bkmJ0QTlghFPq
	FmEZMw3B2cRbmXz9ixoCmkNg4r+9WYe/eID6/AwIBSPtVxr6HTIWMJEYVEfQrA==
X-Gm-Gg: AYBFou0c6GafjAEim6KEzL7Xoa9bvCq8M3gozfSmRYautDW5tDu41LIqBvrdq0VXD/U
	+gR8lgry7Pl+dPOG7Q41PmiPAblCx19WL2MhUbTVCkb7RyNisPVF/9C+QgufctwFCQ6DZeiwXOF
	yYKKq8e6JJ5Qu3FV387No46AI1cBB8gfHviVA6kazr/YQOvQNpUHj/f3aHJ9dPpYr5gxPzsMLpr
	sJbITgDmrIOtzSar7A8tynBQOzmwbCelkNXNmXlMQJoVP/VC8CjiWgbBTbB4rLbbkoTa3N+jG3+
	IX6g85cxIZ49cRnzeOcwBR9LmnQ+vv2W6M+N/lXCWn5VhszOfzJDpHpYGAaD/9E0IJonPKr7CVi
	GXZ6PK0TXw7vhPddRHOpHjqxADUjwAnLr5s3pjaPmn7T/hmhGycZ2sN4ux1GG/2gigDSV9//yx+
	RUNVcfUIKmHEp1xIi8bIwmsSCIUdhNJwQ8qJc0bDchnswa16JySNh7TkqUNxa0p+oUJErcEwUZj
	PoEGZY2BVUhdRb9Hu/v411AKPxV2F1P1U2WJq4AAk8zec89GdPH7Ve2kuyL59niSaoYY9Fnc92G
	/vyGvMLUvS5RLr3ERf52J3b4/EZcsLyWMOAzQDY=
X-Received: by 2002:a5d:5f55:0:b0:48c:5304:5e50 with SMTP id ffacd0b85a97d-48e263ad234mr6380085f8f.0.1792603762495;
        Wed, 21 Oct 2026 10:29:22 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25b04883sm7166266f8f.0.2026.10.21.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:21 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 6/8] zorro: warp mfd: expose the fan duty cycle
Date: Wed, 21 Oct 2026 19:29:08 +0200
Message-ID: <20261021172910.134838-7-p.pisati@gmail.com>
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

The diagnostic frame also reports the fan drive as a percentage.
Expose it as fanspeedpercent.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/zorro/warp-mfd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index 1bd7c701df8f..dcf13e31bee2 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -296,6 +296,7 @@ out:									\
 static DEVICE_ATTR_RO(name)
 
 warp_config_string_attr(boardname, board_name);
+warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
 warp_config_uint_attr(hwver, hw_ver, "%04X");
 /* board sensors: volts to 2 decimals, temperatures to 1, as WarpDiag shows them */
@@ -308,6 +309,7 @@ warp_config_sensor_attr(vcc5v, vcc5v, 2);
 static struct attribute *warp_attrs[] = {
 	/* RO attr */
 	&dev_attr_boardname.attr,
+	&dev_attr_fanspeedpercent.attr,
 	&dev_attr_fmwver.attr,
 	&dev_attr_hwver.attr,
 	&dev_attr_t60int.attr,
-- 
2.43.0

