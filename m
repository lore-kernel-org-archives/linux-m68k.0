Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1EF314B7A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 21:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860477; cv=none; b=uk7tWnZvNSR4fcS7Xc/jbS1v6441PWmVpBxYniyGwBDDGFhYnGQ/ZRt7cTimSLOOA/ioydRfUmp1XA47tNT7rCewF4uT+CKRlz45NKwblayVntTGLk+w1wiEtOppmVZninyGIuqkFoIQc2Kr+Qh5r7f4ltJcir5QdP2R1qcevKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860477; c=relaxed/simple;
	bh=BL2gcDsqOsH/kUfGx5gIYSBmw9tJDe0SyiHyKUxzwmg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E/hhHOxaobic9ldJkR8QcpEYstflTbXkFihLfvhchTwFnKxE52vUbbKDvTHsNcob59k2LBf+bz8QGLavJn2p9sDPLj18UlB6uYb14yC6FDcKP+mEpWz7uh2Q0PByXJxOnBBQvzAatqGtfI6/BNUPqt5pZWuPbFGUymaaDNW3tKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDDHYHJA; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDDHYHJA"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7042e50899so176867066b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860474; x=1762465274; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ck2ZSs5oFDctNEkipq8C6FJLeHmWTqbX0DGm3ceJvfc=;
        b=VDDHYHJAg0FSoLO9kI8rhwmCK3ZPWpdDGv0JkztdFWfeARoi3FiJH8nga8q+e6z7ce
         Kd1nT/MFLQTgfSl6647uwX2Mu4dFgdt65TRiUrJ1RWVH/2n1Aiqgp4VFlmyv2GcsPT0w
         5pokm1BTu/9zsPM9FYZzM3fYGo4/OmrEiZAc/hPfz7s+jZyTk4xBQZx+wiMH/pMHxUmb
         uGDBLt00HLz2gVAQs1JNyK/kp7mxl8sKUqxKE5yfifW8/SSy75/w3h/13jPSbBSv16y2
         uC6Rxypw8cZ6Pgm+0Q++50eH9vA0lXoAduHgGHgkAICuXE7QlwzVzSOybsdVDjBXDPYH
         c3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860474; x=1762465274;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ck2ZSs5oFDctNEkipq8C6FJLeHmWTqbX0DGm3ceJvfc=;
        b=CRnMMNYfVtErD0hZDwDBLweQRKqhKcmfjDQA3WZnhp4gzMA01p2dkUY048nWluEjcD
         FmihwZuT2mtbpXfgd2W4DP1Wa+EkNhZbq235Azd6ynCUtz4zPR9TYcnxFmqfUrrXs23o
         Zky/g3bOkfWcX4jmBh8Wl1Bvd4t+TDc+z7qD5aT681r7MBZKFDWhLLbfoawTYYCxzN3r
         pTXA/8IAOYkRtp27mnuKF7nyjrmirPlndA+Njgc1PgKRwls8y9LDA/CyqLvLRmnmEuRj
         KXIvl/3peWE1qG0qt/baPZ1Yq0LBqbmcoVCRC34wdSiYvQUAwh+qpp7bbvT8+Y/qyVrW
         Fgqw==
X-Gm-Message-State: AOJu0YzXdopdvPh1/YLr6J0DK9eikk9kZc58Xqi2a0wMEmh7jEZtVToW
	Og7wbeFAGAJDJH/3rpbjA6vHQ2U2wmN90aJ5BaP3TUeLMTYwXeAmX7Yv
X-Gm-Gg: ASbGncs6LbOZ69dicejFV8v/+R4x1HVv1v0C9DC/zrFbJJlTPOb+lRfPDbO/XPf0lbc
	AKaWL0U5u5s6OaBkfujlZLP/IVsJ7SB2qPsHOj3oWI+zmcf40tMg36cdewkwZRaL5WxBnr8JIL5
	YhV57xmd41+ZmkwCuIfjyh6nxV9+kXpuzzlQ9HIOMSCvz7unwXH8r3PGGpYTslnL7al5fTNGYDM
	/lh0CH68QcUz8mfHr5JZbEaSgb16GeOIAxTSQSO2Kd6EK8en9/j5iMLUCAfA61awSAGVhgritDP
	IwaKvW7pfgbF69MeK/iaQrFuficQF68XR22pWOhuFtnqenw28sP2NxG9/SQwkLHM4K5n0khuD3N
	x4ZaotA6zmwUENWPGYaXM+kdGrr0rLR4HTFa1mQPislyVJzie3wAPc8zPLaXHcI6Mniii/6Jc80
	bHH62sAdp3ZeQ2ZvNUJF+BgqbNOcaJDIHQPvWXaAltI7Y+qcgEbCuzsQFIO3JisVwlnZVxWfHUn
	NhPLjIreswX4eCgb56V6uUyysFyw41N45vDWUV142RYxvYDHMEjPg==
X-Google-Smtp-Source: AGHT+IHjonNJY7v3yBQd3MV46djU8t/giJRgAZF/fV+bC+xHHeZMkRdA8EB5KkWvu5NDjQA7pOpVOw==
X-Received: by 2002:a17:907:6eab:b0:b70:5a76:d3e8 with SMTP id a640c23a62f3a-b70700bc350mr112939266b.8.1761860474010;
        Thu, 30 Oct 2025 14:41:14 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d9b536710sm1514947466b.57.2025.10.30.14.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:41:13 -0700 (PDT)
Message-ID: <bf564b19-e9bc-4896-aeae-9f721cc4fecd@gmail.com>
Date: Thu, 30 Oct 2025 22:41:19 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/6] net: phy: fixed_phy: add helper
 fixed_phy_register_100fd
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In few places a 100FD fixed PHY is used. Create a helper so that users
don't have to define the struct fixed_phy_status.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/fixed_phy.c | 12 ++++++++++++
 include/linux/phy_fixed.h   |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index 0e1b28f06..bdc3a4bff 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -227,6 +227,18 @@ struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 }
 EXPORT_SYMBOL_GPL(fixed_phy_register);
 
+struct phy_device *fixed_phy_register_100fd(void)
+{
+	static const struct fixed_phy_status status = {
+		.link	= 1,
+		.speed	= SPEED_100,
+		.duplex	= DUPLEX_FULL,
+	};
+
+	return fixed_phy_register(&status, NULL);
+}
+EXPORT_SYMBOL_GPL(fixed_phy_register_100fd);
+
 void fixed_phy_unregister(struct phy_device *phy)
 {
 	phy_device_remove(phy);
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index d17ff750c..08275ef64 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -20,6 +20,7 @@ extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
 void fixed_phy_add(const struct fixed_phy_status *status);
 struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 				      struct device_node *np);
+struct phy_device *fixed_phy_register_100fd(void);
 
 extern void fixed_phy_unregister(struct phy_device *phydev);
 extern int fixed_phy_set_link_update(struct phy_device *phydev,
@@ -34,6 +35,11 @@ fixed_phy_register(const struct fixed_phy_status *status,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct phy_device *fixed_phy_register_100fd(void)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void fixed_phy_unregister(struct phy_device *phydev)
 {
 }
-- 
2.51.1


