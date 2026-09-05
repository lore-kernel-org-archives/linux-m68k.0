Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F313E51F5
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601633; cv=none; b=I7g2quqT5bFrHVb53+5wNwXJiM9XfAFVNjCzupoVMyzfNK3oIfmImlhxRfgXTb5bYVzbKRlgTziPTXohZPKG3e8VWzulIr/skaCEVC+AazfeBPrHESWLwEsT6+ubDKLSx0vFqGC/K/2ULOlCd8/SPAwO6mVXyYR1lOMacDHmEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601633; c=relaxed/simple;
	bh=r1zTAstGx+IQRZSz2V3LqeUHrdmsIckPyGpER4pVwcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F/w6Ye8PlSA8b3kMGXtnAGAfm0D4jzcrYdGktVMAGVPlmlptV3XLcB1ihXZTJFu5+9uhgGTXO5+fDtmodVswlPN+VOjTowPl1N9GrFZUuvc7gsrM3wVAWLw3EG+hJYjbIVV1m3EOgKfwZoAaskJsvPhtsRUfcVLst8jPXNdBn4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVCDjRWM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVCDjRWM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso15349545e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601620; x=1789206420; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rL+/iAM/i65sRrJdGWBjEYqO95wvZ81bUVdK7eRsAk=;
        b=FVCDjRWMxSXTbBFmUNrhF1RqH/WD4W15+LZNg91KmHNQQPAql3dyUH2x1gki+4NoGD
         daliEplhbmwLgxqpbG9cX+FfqpQuaPkqICKTLV4bzrfnFeC/AhrWnBsuuPu9BMRTuksP
         d5DqLWKbZ9+mIGEpeE68I8g1Fuk48fDhbadr4POPhzLspPUQpRiZZL/yP+inpHZd7jTF
         8pWax8Ut+eSRVCH/h6HUG8ZFJyzwR49/G8QJFJEhWZV+3pXRrt9bVzwRvYMhRfQ0OBVk
         Wz7QUVSGycSBDQ5zSLKrVszcngPdASmt01X/sww/LnQPOQcqj98Obx5U78lK57fWUT4p
         SJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601620; x=1789206420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rL+/iAM/i65sRrJdGWBjEYqO95wvZ81bUVdK7eRsAk=;
        b=TN1WMJc/YlYV4B5b3iPHFL5/UwkrOiH8wq+f5ruAp1d5bYCmotfWULKqT9zkYwQH39
         fjcGPEauatyxmigIKTkRCHbynlWT4scgM3e9R79usN8q0VUXiDtMlOts7hiwKjRcj+S7
         oyaLoO3/JcWRJNGwGbjwxDLtht5GSUkJjJHEBxswftaOeYOfHiUEPdM9q9sBGW+97teK
         nKfyGBpnL8NXWhhyprUZflSsWGR4n2ELu1G/KZ6ECpBvFwS1xPafC1U7hu5Ts5junU/C
         RuB5HRUC4GitV/Ayl/rbrlWkN1DEW1pAg8EdnvXGgnrazGEUFZBq073UDon/VS6mzISI
         d0gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqcmhQE+7U5Wd+qvsdWCjaw05YmUi9H+99P06l3nGaxKXfjuezw+n7nNgA9g2FRKgHFvapTDV5TRoS@lists.linux-m68k.org
X-Gm-Message-State: AFuF++l7Jkij+6Bu37SK6f+eQBevl8i1MzeqyVYshOOgfM5m4O46Gq+3
	BoH4aKRMt99TEyHvb5CcjcOD5YMvbl+9IK3zLV/W8/OP8kdTZUL8fBRh
X-Gm-Gg: AYBFou39EtEN4aBg5/RPBoMxFJA59EzM4QbuLwwq9Wz1ujOIIIX4uhUFI5eBgYpQHLq
	FMl7IYQi74JFILvGSNb+Fl/whMd4lLxUwqT6QY5Q7wQeGN6kXLtm/WXcqEWSfQc5MGrJM0bbGtb
	9uV8XKiql8Fv/073O+f1y/LC5wqBdMqtmV8u7tSOGKuBo/jJmK+VpgZe9hCycMp2asg8yjD1K/M
	Xle+mJT/Yj6XGZScnxGrDU8qtsRR0GuTQbDjAjDh1w1wXGbPwSoyzsOiobhFv3CcKVOs5RG18Lu
	O6JuqFMySMu3DPp18ASgBlty3lh/x26vd7ftLYDub6KyAaTdiz6dcoeD7qwtDsrEhiRSuvpwxS8
	9HBKw7BVH4ztiHbQtAqb7hw2wwF8nKLUr1NTwLsChEihnvZ6IbCxiajET37Ewj4boQuCvYoWVQ1
	gZioV4/PID8BbYujDhY9+e/s2mJ2DG5j5LGiE0nXBp41D6WBcAbMfZOgF/qgUi9mYYXW/AnKE3J
	DP2wXdQJ5Fl5zkdpaJkHP7N+rJ36X2dtIF5Drh0lg2b+XazcKCCgeZhi4KJm3pu60q1RtfMgiv6
	gmXKC8FeTXjUTAnrvcVc6ISthiRxblRFiQmdt5GpoPjJLszZqENxNs3rZOX7CNpF3No=
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr138818915e9.12.1788601620145;
        Sat, 05 Sep 2026 02:47:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.46.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:46:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
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
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/9] docs: kernel-parameters: Remove ten entries for parameters that no longer exist
Date: Sat,  5 Sep 2026 11:46:40 +0200
Message-Id: <20260905094649.41996-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-parameters.txt still documents ten boot parameters whose parsing
code was removed with the drivers or platforms that used them, one of
them (atarimouse=) since before the git history. One patch per
parameter, each with a Fixes: tag for the commit that removed the
parser, so the maintainers of that area are on their own patch only;
the two pata_legacy module parameters share the last one. Each entry
was checked with git grep for its __setup(), early_param() and
module_param() handler and with git log -S for the removing commit.

Changes in v2:
- patch 9: drop the Fixes: tag for 0dcd0a76370a, which removed the
  separate pata_qdi driver and not the pata_legacy parameter; both
  parameters went away in 3c4d783f6922 alone
- collect the Reviewed-by and Acked-by tags from v1

v1: https://lore.kernel.org/all/20260905070347.25902-1-kmehltretter@gmail.com/

Karl Mehltretter (9):
  docs: kernel-parameters: Drop the atarimouse= entry
  docs: kernel-parameters: Drop the bau= entry
  docs: kernel-parameters: Drop the edac_report= entry
  docs: kernel-parameters: Drop the enable_timer_pin_1 entry
  docs: kernel-parameters: Drop the mini2440= entry
  docs: kernel-parameters: Drop the nomfgpt entry
  docs: kernel-parameters: Drop the omap_mux= entry
  docs: kernel-parameters: Drop the pcmv= entry
  docs: kernel-parameters: Drop the pata_legacy.qdi and
    pata_legacy.winbond entries

 .../admin-guide/kernel-parameters.txt         | 67 -------------------
 1 file changed, 67 deletions(-)

-- 
2.53.0

