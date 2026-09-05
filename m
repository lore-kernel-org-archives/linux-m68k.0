Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC53DDDDA
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591847; cv=none; b=ZY09K/T9R1GRg/Yw37zmfGccM71wWxGv+LMrbsbuZ6sm9sDrzEtaJKZUMF29HkygBLCs3aAoI8Gfenb/nu7HznT+V2yXcD8PKDp16WpGH9K0yh1VEdNxhKhD1TY7Aa04AH5/DPTx13MmcDKHJroZbwt5myUWRktT1uMv+c4jpYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591847; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ubbOmGBTS27MB8JYlVpHbY22w4qDSbrkb+pPS64hRYEQklCE/8o3ucRszaCl1LEDmkuO2geQO97DM/k0tnVYEYn0O1UOw5lToDq7jVy32XIJxvfhH/9k5GlpzFegwX5PThqVEmAweAPe+B0zXSRuQYsZPwfa2kMaHJljkNfdsLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBWmq13h; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBWmq13h"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so3071946a12.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591841; x=1789196641; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=hBWmq13hNV6cdzmGoAsXRe4JV7Uv8hDI+jqwmdBd8u4dOvntKJUX2wAlOG12jb3AOB
         /RcwQhdNKDmntQa/qTzkhcAHHWWDdLymnKX4+eTlCPnccamduOwobBDrYEj2D5YZV80Z
         a+RsKgyyMUZcwFyNheG3kpWYakJGmr0OX4FjtknPO7yIV3VeOimNoYkcLjv1vIEz6z+8
         5Cc59D8chNBdoskmcqswTMvLYa4GXWK06H1Ds0spYkZM/cGCOopv+4KHVWS3/l8pOl/U
         C3InBWUjzbuafDIPzxAUs2l1H9aP/ki6aH8XewywTaxQnCJU/0JrCSv1m6CnklGXeRzw
         atUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591841; x=1789196641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=GJbXZxeTrbH9PI7gXE6aecfL5Zu639baUpHr3DehpqHH5Vo1J7ezEfX3evaIDHmm7T
         thNx1bSrmgQzycCnBD2q4f+aesMQmOFVJVuTwBbXE0kn/YHRGHjX0nI1l8ZMliukiceF
         2JNzBRF5yLsJSOk4QBwN7xmfzSui82Qb0xFzyuGj/B3iweJBX9Das6cHnkMJob1ROiAO
         k4tRGg4QJxUNhBBLvBo08+BgJZaCR/xCEVkkPm4QnRss9qm4KnVD7Kguh7PeC8OgS3I3
         enJ6N5HVur3aIJnIgEwkJ2Ud/CvtGmhonJzYAK2fit1E3JnseEgmWds185NY14G1vNUQ
         4lLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjXlD5sLWunpxWC0JGE6TgcPCxg3/Mulm/65HeUFvwD5JcOSBLwCOodHYbQOrJqKwzc7n0a3cMJ765@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mKj4d5WLLb+6hTJJc8P3hl06Mnq/py7X6Tcd4HXbkuOFH+Ngfr
	/WOqNmQpLsubfnIZfuR8RSHPwh9UOCiyULacO70cT1DcH71uPMzM2TVS
X-Gm-Gg: AYBFou0mfpRcLCj7K8pRcMGMb+eppo2blxwPw8TFBfH7kUdGWSBPPlJszrr8umWqUK7
	zmMc5X7rAtfOAoXz72pMy+hawXJGt22ueezus7Ve8Mz0lAcIcCn4QeZmmO8DYzFkr8z7Ya9Gu6u
	XgUJDK8wSmDVWNGWnNBcDWyKnghzA3G98C36bQioRVJq5HowSp5WYoq+86lMbw1YMz6AE2ghU1I
	5knqIKkq2FkcPthN4TeVKlCV741lX/lBb6HNYYL+aqs+tkuVR53WckVaVPrUupv0V8LTGUbYNIj
	2Tr7DLCyMTdI5/DBRfx1EI5TLioVd2eC+od5+Img0R2s1Ba1IHv7vzvW5QWkbdMzS30kVJZ5pJ8
	U9jjTO5t9tz9/KoW5yg8dFePIory6l3bJDQ/zxg//D+HGpSuwWU/M0KEcz/jAAVD94d7IV2We2p
	m2bF0HDPYugmc8tVXsV29cQ4uQaHjOe8fures/EhCiYe5S1bCKeWu114WCz/6kn3AGGnRuOUBPw
	Bn2dNG3VGw4p7X8mylW6ZrI3ldKaJ6iHT+q+u/ePVcM9ePYv8IYFD3o1H8gCUEgwz/5Co4tr9Nq
	V3wg/rAKHaKTIAXhzwSYH8ZnWGRgSJ3nVFDkDrivonTVqKZ8fjn2xiREbQ/nMCt27SGfORSb
X-Received: by 2002:a17:907:1c9f:b0:c26:1691:b374 with SMTP id a640c23a62f3a-c261691ba04mr359894966b.45.1788591840842;
        Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 09:03:41 +0200
Message-Id: <20260905070347.25902-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

