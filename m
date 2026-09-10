Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD14B35E1BC
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003975; cv=none; b=to5zON2sDTxrAHqvZ/qygYz0PM9G6sizuz8tOA3H6VuCz9XAORx/EJugqE58gjfP3fsfePfA8g7Sg4xYzVwx72niI2K+OEEclpPJ2lgJgVGy7lTrcxPe/d/aGGEAZL8WLi9GeGp2QlF235hN90BkIK70v+LoqUdFZn8rEDgzKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003975; c=relaxed/simple;
	bh=XsI6Y/1sSLQp0adjnMZsyD3THyVMp5IicuC5nSeg3go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y1GFSOfgdE680OAQhCJtdTQFzGrTMg2/tMW3EosUFcGdr9Z8nekoaBwYvzedj0WBQJ1sCy4YaLIRu+iytNxnBnswqx+wfxNItVBPGFO8SYjG0dCvwYi0ZJdb6CR7vf38wbDS6R95+E2yNrVdX3QXzrizQ7qvxnlRQUER1TexqWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekXPfzv+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekXPfzv+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so51258105e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003971; x=1789608771; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=;
        b=ekXPfzv+64IlxHLSDNVTBNh6PIPhg9x7xq/plPokmtUTfAi8jTcY0431Ku+F5z/6hd
         xBx4ymaHjHAFy/Tb4Sf/kCLMrLIskt87pcjUEejVyxDV/LUH8dAfPGF/om8R/EiYLVhT
         EEZsCLLHkC2rUl86hWnOGc6oA2yuIReDtdsiwtNfoENnXNNyUf2Krhvc632mdo4zeH51
         mpRuSrderlNTgl/qdvhxu7fuYebX2+pF/FN/+l6lqsbd94NovDAcHXt+wENpjARv1XKv
         QU7nwmLxMX656xsu5IELpNVISVFyaAFXKn41SK4nLoeWoGvCKlxf/ynj4FZqLmVzZ9mf
         cHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003971; x=1789608771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=;
        b=IX3txm99LiIVLNvkrmst4uuOz03xr1U0FqSW5eo4tQBJGNkq2Wh+0cMMa/5v4iFh6t
         QDoG7LyQr/5PqZn7Kv9eRsOlaCpeFkcSUP5i2WwMnoKsg7CwS65St+KN+pBwJGsWl92O
         STr7H9txFyglUps/qKSjY6YQEWBjmezzDN4n/tsFierSDUi+jYhicnIx82knPFKac0y0
         GpIS95QCvEqt7RhjGcfOPqru1PevwZLYYQGsUz4CpHMQLx+yLww8XXoAVfJAtl3fNSt0
         eFg/iWrrvgitjYpX2+OBNnilJPIB6QayBXCMsL/9A3tlxhcWDenGXbn6Jx4FlBkUIeR9
         2EPA==
X-Forwarded-Encrypted: i=1; AKwUvBwrV49AkToI6kZuHUvCmAF685dZ1K1VcC3iTiyVrM/DM8rJkS7PpXdA7JKjJ2p5BbI9Gt0UotpcJQop@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lW5VpcszspVPRAXZA+b9xST59cohPWGviATycVeupiMfeOgaQ3
	Vg9qZYhbjBXuzayXDTdeBojc+lZHkJO6IhW8i6k5ZorWyW9Eleh6+z3d
X-Gm-Gg: AYBFou1isqv8haPCc5tLWl5K9IA3gNEYIoBTcHYJqi+bfQ9+4IONCadl0HW0VVF9uG/
	GClEZnQlbgsKNgy7KjH+brMBL9z/djbf1hSDo167APP/+1Qan416k3bQLIs1hEsoUURGjH5rsbH
	1eJnAK7Za1pY9txJkHi5s2umVxcsEhGFMiMWmnn+PWQnWTKEOUp+yXQlVfwPz6W7y+SKtyFMryb
	QFamsfFKv0krPdrykwzRzJ47dP3j0xpnhhI7vMgBmlDcQvwGFWBK2wWXpBDnd69X8DUUdq0BsbQ
	VowoCvZB7P6cNRQd+K5tNmsFDxEE/5W/TYjsTQCq5GKwA1ZMt60TDelcnHnERTWtT0hmqNY6sZJ
	pHvW4yb0KjMJWimiO5ce4H63309b2V8lqSD0hNVgDAuSkWr2Pmlm4eabWcU+k8pdstDltUljAvD
	5AjyMzQ5mRjbNc3mibjv/tpj5YzQFQYh2o28cM794VgOCq9DB+E2c9ZhiZX0f9ckE3fivPP4Z7t
	CJ1aks/s3/crIwvslkbULEkI6Bg/YFz/GDJbWMODbZgjyGUwAtR6lpNcHpVxaTSDXTeMpGdF4IZ
	e2sV6ytcqGMZw9Xlbx+3XObsr8DbNPHo+Uje1kiMzYfYqhQvTDmKFBs0uUjgcqFlRk+EFsPfdLd
	j9A==
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr368280035e9.2.1789003970778;
        Wed, 09 Sep 2026 18:32:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:50 -0700 (PDT)
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/8] docs: kernel-parameters: Remove eight entries for parameters that no longer exist
Date: Thu, 10 Sep 2026 03:32:37 +0200
Message-Id: <20260910013245.8619-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-parameters.txt still documents eight boot parameters whose parsing
code was removed with the drivers or platforms that used them, one of
them (atarimouse=) since before the git history. There is one patch per
parameter, with a Fixes: tag where the removal is in git history.
Each entry was checked with git grep for its __setup(), early_param()
and module_param() handler and with git log -S for the removing commit,
and the name is absent from the whole tree at that commit.

Changes in v3:
- patch 3: name the commit that turned edac_report= into a module
  parameter (fee27d7d9788) and the one that removed it (7fc0b9b995f2),
  Fixes: tag moved to the latter (Boris)
- the pata_legacy patch is dropped, Ethan's patch from June covers all
  six parameters that commit 3c4d783f6922 removed:
  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/
- collect Reviewed-by and Acked-by tags
- the "Found by cross-checking ..." paragraph dropped from the messages

The remaining eight patch diffs are unchanged since v2.

Changes in v2:
- patch 9: drop the Fixes: tag for 0dcd0a76370a, which removed the
  separate pata_qdi driver and not the pata_legacy parameter; both
  parameters went away in 3c4d783f6922 alone
- collect the Reviewed-by and Acked-by tags from v1

v2: https://lore.kernel.org/r/20260905094649.41996-1-kmehltretter@gmail.com/
v1: https://lore.kernel.org/r/20260905070347.25902-1-kmehltretter@gmail.com/

Karl Mehltretter (8):
  docs: kernel-parameters: Drop the atarimouse= entry
  docs: kernel-parameters: Drop the bau= entry
  docs: kernel-parameters: Drop the edac_report= entry
  docs: kernel-parameters: Drop the enable_timer_pin_1 entry
  docs: kernel-parameters: Drop the mini2440= entry
  docs: kernel-parameters: Drop the nomfgpt entry
  docs: kernel-parameters: Drop the omap_mux= entry
  docs: kernel-parameters: Drop the pcmv= entry

 .../admin-guide/kernel-parameters.txt         | 54 -------------------
 1 file changed, 54 deletions(-)


base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0
