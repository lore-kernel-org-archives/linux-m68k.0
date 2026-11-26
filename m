Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716719;
	b=xNqB1iyqYQBD8eNiifyreebmnepq8mJWYemz2130HmbMCffyd6O0doHHdxzlrd0LYXBI
	 86MYSef/ZoJ4xjrsqAp4Y/syaYRIX63FUNYf7e5lj7ftCDftea1WriAB7PTLXJVLuPYgd
	 7kv9I38nqoRZWX0/6xAW/NP+yfTAoLmVbLGjacchfQJ52o3Yu+WXhqT2/IO42tV4DsPQ9
	 T64uGVlQcrCU9tbJQhkrvY1w1iHVetjYFqrOpDb5P8/7NdRGAxnB8bSr42LRrIu3M4g56
	 ANowp6Qqz2SRTu/QFsxBT8qf/4v7BGmWmZou1UHbxk07VxU8flVY0SAI996F0rL9zdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
	b=0qIw0HcgaA19IQ0TSGmkvExJxQN/W0FLQ8JJiw5UsU7NpVbvxF+78iaNkVIbZ0QNfeJ4
	 WYk9gyUNL4OVcsC9yQdnvseuS/BJcmfjI1XURLb0YLDP++Ny5pVNsPBqj+NW/Jo5HIK/c
	 Jdf2mYqt3AEwQZhuzuOrn5NpQCdD0j6u9r7c1OLLzuL45XITpMhzmtFFcxV2YGX6DBgxb
	 bTLHOB30eiJN2/7l/ULQJJMw3K1fOVlGio18rV6ow4LgYDurJwu2NhzS/Q8cm3cpW+9GT
	 fm6Kt69BF4cEx2Ryn78kXG8s6W7biQRA8Z4EnTMcD7+4wVjzLzNWKA7obPLUHwt3qlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLfbUxda;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D336606A321
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D336606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLfbUxda
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b589050416so1452154c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716718; x=1796321518; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
        b=BLfbUxdasPCe4vUG96CqszaZOHiBHYcK0Tf9epbIXIFfvE8O3usKasyMb6MtvQRiiP
         QjXlgVIIolJz3wHYUBcUPvGBBWcRwpwqteJVnLoE/RhubEH+Zi5+vkChgRmTTsrFdp1t
         15q5juGf6sE9ZprXpxV3eXjANuw2IIN1D/bENtX9XG106Z6qNJCC13paCpkMEley9KM3
         Fah04/iUP8WSqlsSmYmzQlPZxdcoRrs+mWPRETpjpge/sqR3UbHlGhkhGZezX+bEPVCp
         icaRVm+zuTH41C78L1bCGUHd30NFWQCL/C9FUCyNXG02AmEtuBToVjchYC4njOhsc275
         QHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716718; x=1796321518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
        b=u8IykmhGhXjRTdKRvRTL/KAPnbz4kTCchyWmDZUMBB8ltzCSdVH6UvvdY9tn9NmsCG
         zqon5yBqHcKtpGfwB+bKll3G242wzdW/d4FLLMTCDlkdt1fvJRBnzY04TUMX1OsKo3tx
         DWTfIw8JlDbJgLEAJYkQio7aFkUUJ209mhhESSCgPuXsNeb02aW4VtGuCW7y7uTxkFj2
         5m13DxXd0WIec8XDiMQN3Hkhws0AEJelJLsIBCgyzkpz+icyHJ4m507NbFfmhMDMn942
         QWsSK+eAY5iyDusr8gntyPg+1lAd5KHbGic5ysHjoNg+h/8fnR9XbcpZ9nHAHLFWiZ7U
         Tk2w==
X-Forwarded-Encrypted: i=1; AL+hErEd1cAi3aVBAd8krDrQnhOBZJQhzDW7D+p1A51ZIZUp6LQLfS99pdNoHjCz1Mbs7cwVsqlOr8HMyev4@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8dCeIEK7coI2y7oiDoRYw1o2CAnz/Vf+9YdYu7UK3Ue9YIJ2uA
	54avYtLe9IYxrQG++ypN56YG6ZEILfSALcssKZJS/oPj+N4kVKoO38/4W5fICg==
X-Gm-Gg: AZFdTZcUxrgC0uWhLz8aIZj/zEblg3gwB0UCGBY2UQ0wDX9IPiThHFV2yytiIcfdOz2
	JSZIX1iV1R8P42pyWxcO28MIG8SeJ/9OCg+pWVy+0oZM0wlruT09d7N9mBbZb41bWSb3g4iDPsD
	U4QgJaMWvWJKFQQV2eLTwRTU2aGC5cWnATDpjmfCBRKWiK6Wuwtu/j07YGw9gFSLl5JHnzJZwGa
	o2qnNtlBka3A3I73NcVt4KTn+OEEeLSo/lvGynjlxzGBALP9XHddugL99ezZw1+eetVDWp6pXtk
	KxkSXsCsBLctOr7kP3gPa0HQHUzKae/Kfgf4WLrIXnhy0+ZR9D2kBUejR3Axtmo1giW8KQ3s6/0
	sb9OoPZNUKAoGM3DsS+6nvoh10MYfOR5e1Gii9hagr2x0CwmL4BEn6+t1eqWj5Go94rvooR0UAM
	dyxhAqxpydqg+tyiy8Zl3VHbuyydnF3TXO7WIzE2U07dP06pPwRuzPHoJeFJSqzepQlvi1AMr31
	yL/IvlrVs+moy3siymY+XQBYtKknsyDmv2okk5NRk8O0EJuFrmbTPUmR3H0fRGUxZYaWNAKn5im
	3N2uwPlG7QfvEI3L6fn6TKIh16S+44708YcDu4cP1Q/M7Q9JVGXjt2hZ+wxeDp1kuPHpLJ99FFw
	Hoq+fgnGINom4jeWIhdjx8ag=
X-Received: by 2002:a05:701b:2815:b0:1b5:22d1:1eb5 with SMTP id a92af1059eb24-1b55693615emr22539079c88.37.1795716718270;
        Thu, 26 Nov 2026 10:11:58 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:57 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entry for goldfish timer driver
Date: Thu, 26 Nov 2026 18:11:01 +0000
Message-ID: <20261126181101.3715754-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
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

There is currently no MAINTAINERS entry for the goldfish timer driver.
Add one and list myself as maintainer, as I already maintain the same
driver in U-Boot [1].

Link: https://source.denx.de/u-boot/u-boot/-/commit/909f717eaf29 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..4e3c24b6888e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2078,6 +2078,12 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANDROID GOLDFISH TIMER DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
+F:	drivers/clocksource/timer-goldfish.c
+F:	include/clocksource/timer-goldfish.h
+
 ANLOGIC DR1V90 CRU DRIVER
 M:	Junhui Liu <junhui.liu@pigmoral.tech>
 S:	Maintained
-- 
2.56.1.839.g22a8290db9-goog

