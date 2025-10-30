Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D67D28312D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860790; cv=none; b=GiBgtfi9NG2KLGahe/qU+r84lfZew8fcN6ZJm3yzkRmDCFRUZ9MQ4c8751s2j1SLmRXnghxyyWTPuuRrsA6DtXYUNCB2khrl1ORPMiSFgYdmikEHhZpS10URE6VxKk+CCamBelL+nQ7z4pNynPGpLpmxApgMOipl4152dKXqtww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860790; c=relaxed/simple;
	bh=ogoAOc8noYnRP40EX7FiNgpoMABPPHmz1IvTtOqk89A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qOlY40DYA4z5KyYOsZqYa/g4eQM/3h3BYFfwlp8DxJqG5n0jiiLj3OvGpuR0EhN6Vricxzb869aYo4ov1581iTTxGJpi299+DVmEZKED3ZRNPoBWn4utOf1bjybiTIOv7GdR/WmwHztoAKFzd9yAuEqyiWofJf/cIJhlin0qfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0zNxY9Y; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0zNxY9Y"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso435921366b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860787; x=1762465587; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2bmKsWX27KxcoODJGcbcMlZnZNIE40/bwILX8cp33g=;
        b=c0zNxY9YGomG4xeIzK3WCmqp2KO6iNLxiv++zXrAE9fZ49EH8Blqk49+wLfOWsGoAe
         vqZ+w4t9XqxewcW3Vl8Ta5R+dps4zj8PpHzRg47utQ8u6t6zBKA1kbEMCHuZA/evbvDs
         /xHmp7sfIw3wTF+zi4tvjhjg5nOnEr8hmJNl79xTHANBXrmVpL0ayR+IGCwP8YaNkZ1/
         J23RWSp7fxY84mragCgzSkGbg0eYH4/527xAkUnO8cUT/VxLTtbaPPwUeupfyS6EXz1s
         b7VW2zzNwu5+d6j5/3z0j0wIOQ9ZJBcDAbGTCpQv0d2nPyzQeO6cHRHHunWBGF9SXoJv
         7Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860787; x=1762465587;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2bmKsWX27KxcoODJGcbcMlZnZNIE40/bwILX8cp33g=;
        b=DHcIDnDPdcRYe5QQp7Y9YbidNDPglcIN2OGmZR3s213A7SG5BGgobzWCiHycoALB3Y
         1h4en3VlheyPxgh81VRxpZwGmh2cJjcs8uVBoGGPSlrULnTtrGSExJqEoEfNIiH6M5dG
         rx4U7Rw5q/fKAA6IC85mc8TalsgW9TtGkHrNlamhthFOykw/VpAX9xISIC0w/waYmEmo
         Ky6GXEzJSKldqrWn5WXJ3EVBsgAhAXbUcuyEm0HbXW84JCeFmLjAyZzGWafmAqupQIN0
         OiGypLqWVM5gJZsERcxjNb7oIgPWMlm9iM6cMpHVtYEgDhiL06KZu9MC4zYT37Brk2Tu
         4BVA==
X-Gm-Message-State: AOJu0Ywpt3GDkSW8fGl+vHSWtt50K21crivoQVCKOEgIX0xB6wT3rHVf
	PwG5Avv03/fH4g9g/9Gs0CufH0fcnuN614+2uJCbkgI1GLQ66ebNyAfD
X-Gm-Gg: ASbGncu48G5vB2F1/Mv5v1DLsHz3zkTmCWb6ilSNNcgDHv80Rim+ZOwJytaK5O0mdeH
	g7VPoW9W6MwGcn8AAnCXBArbjnVoba9uJjDEcBvc6kKhpBfyd7FN+yjl7zhqE4dZiTeqd43opDd
	0u5FcjkS4Ni2Hx+b5YXz04j7MJgH9NjKO81f6uyiomntkeb/xVNmVw5qK3AIBiWUlmrYy+mI1gz
	PiVA8M4id025h1v9bFWreQSXSDMdV+GyC89WEdaPyMVp0aBAIl5ScBS97hoUVqjb56r7wYJyLIM
	hLq0rZzzFlyZvQx4ZoiGi5W8KLQLNckeSOKpv269wz0TPDxQkq4bqNSzgYK2WnY1DqypaggcAdz
	FeXJ5bBpOgcXVdkBpY/upFQvZao52H3IBor0rwwRoAQrGSA7a+ANgtjh4dCMx5NB6qabOrKPkC1
	RlFsa61jlJ5c7S/3IzX/uNFa9NYdeqLPTatr9h0Wkl2iiIIKcG5hLbzbtGP3Ssp2wQ96pd2/h+s
	RnUim8jxzxUYZJAUJmWcNNP03x4zvwcevbFa7brFZBenARTiP/Luw==
X-Google-Smtp-Source: AGHT+IHttdY4o9D7grpTruZsKEHKhDpt1ULxInoDSp8EgrLjir/7gRBnIDXS9Eo/IhcDhnQCnC8tcQ==
X-Received: by 2002:a17:907:2d25:b0:b4b:dd7e:65eb with SMTP id a640c23a62f3a-b706e5833c5mr157151366b.25.1761860786678;
        Thu, 30 Oct 2025 14:46:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85359687sm1864847366b.23.2025.10.30.14.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:46:26 -0700 (PDT)
Message-ID: <bee046a1-1e77-4057-8b04-fdb2a1bbbd08@gmail.com>
Date: Thu, 30 Oct 2025 22:46:32 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 6/6] net: phy: fixed_phy: remove fixed_phy_add
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

fixed_phy_add() has a number of problems/disadvantages:
- It uses phy address 0 w/o checking whether a fixed phy with this
  address exists already.
- A subsequent call to fixed_phy_register() would also use phy address 0,
  because fixed_phy_add() doesn't mark it as used.
- fixed_phy_add() is used from platform code, therefore requires that
  fixed_phy code is built-in.

Now that for the only two users (coldfire/5272 and bcm47xx) fixed_phy
creation has been moved to the respective ethernet driver (fec, b44),
we can remove fixed_phy_add().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/fixed_phy.c | 6 ------
 include/linux/phy_fixed.h   | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index bdc3a4bff..d498d8a9b 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -131,12 +131,6 @@ static int __fixed_phy_add(int phy_addr,
 	return 0;
 }
 
-void fixed_phy_add(const struct fixed_phy_status *status)
-{
-	__fixed_phy_add(0, status);
-}
-EXPORT_SYMBOL_GPL(fixed_phy_add);
-
 static DEFINE_IDA(phy_fixed_ida);
 
 static void fixed_phy_del(int phy_addr)
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 08275ef64..8bade9998 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -17,7 +17,6 @@ struct net_device;
 
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
-void fixed_phy_add(const struct fixed_phy_status *status);
 struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 				      struct device_node *np);
 struct phy_device *fixed_phy_register_100fd(void);
@@ -27,7 +26,6 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
 			int (*link_update)(struct net_device *,
 					   struct fixed_phy_status *));
 #else
-static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
 static inline struct phy_device *
 fixed_phy_register(const struct fixed_phy_status *status,
 		   struct device_node *np)
-- 
2.51.1


