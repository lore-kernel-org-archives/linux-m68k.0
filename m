Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39EC3DB980
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591840; cv=none; b=C8J/NdGkTBgkESI7LYm0jIYBxvenFO/1rqeHZpbAbU6RoY4cYdje6c13lx0CPyJdd4xNJie02skv/4dAWLmWYpareB1QS/JLole9hKqZEm8c0pLqZoS9gTOOfovBaKB7LlwXNJpOHjfVCjYB9jHoYbkg1RPooxf1Qf3a5I0ZOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591840; c=relaxed/simple;
	bh=cYocdUbY67Nl4dIpxLMGG57akBMxyeedBoJqIxiyUr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k5NhUemAOgESe4KWdf52LarN7k96mb0T8cPTZTafrKsHawdP+LwLewOCPD4DN+Kv8mAjDML+tj4ACluemvmefd4hHpB6qeVomES+2SqonSn6Zu6cMA2qC7gT/rT0o+Z9crDV6HJpcVGyysa78fJP4MRyw04h7euWerJcLfOsRj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJLvCKhH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJLvCKhH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso20115445e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591835; x=1789196635; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=;
        b=NJLvCKhHTVH1PQ7mO5HMoIqMac7BPp18+JtUQ6nxMUxKwN95hgVeJa6lfhlipK453O
         nYAJZWtbZ2UZ7LX5IbOj8a6Y36WOsJQ3UncF7WqvHnkZbtChw7a+jDJ6zorrNK8++QtD
         i4DEhFn+FkM69923j8fUWpVDevys278QOhnE+KfKDnxHwAlR36HoC4fZ2Htyu0FGfnWr
         rsCupceiPaQZhy+WWzhqN9KyHU4AtIhK8ahSGf3T/QmQ2btHx43kk87XjMdCd9HD/KyO
         bPt8Og58ESexi51lP+Y8+ucQikhMQWiG5prQ7ceHTMjRAEOqyg4fyG9WzrLXx3KU2yU+
         RWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591835; x=1789196635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=;
        b=PNaGjwczEFun+eKa7EOstSlJfUu27BxeWmSj78CjrTwsa1Wj5hk/d7tugQDp9xU3XC
         ZYvfFXFACvCazq836pskjDF5rCd9LTvByTSA/EN39G3txwvnFf8Cia/tvmT+o+VNZouz
         YfQzLSilS2FA2p/+Gmv1t988B+hm913JTM0VepproabmVpBOpZ7rzDW7TTrKK/BNOAs+
         Kc7HddYRZzrv4CSOMn+APl+ZAnG85CNNR+DsfL1Es10sOiJa32ew0U8S7wp5XGTRAl6b
         GKTiNA4A529AVZ2cthZtZOLEG+IBmlXYDly6IoY5bMoWXxTymK16HX4vKqNbJSvkXW5Q
         OV9w==
X-Forwarded-Encrypted: i=1; AKwUvByhF7rGpLEnFJaDq26ksf/sZoDwxBtQDr9KHoJHuxwcVgTF8PYmRntYDFa85TzFkhQhheQjM8+Ghrwm@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kqH+tob+mai6E2atCVSD2uX/MTW9SZmOgYVM3mey3C+IQ4+DQB
	BPKoNgoiAfEMcibizxVdErKnID7QPUYpVO8WqCNfxK52V1UmOxQAbDvZ
X-Gm-Gg: AYBFou2VmmPwfWlXnDv3RrNAdDXToOOwFL/3AW24TEBBdjaC1Q9UHZ3OXxedsmrRy6w
	yTyJiMVn2Ug8WWuSCYXeHUiwFI8AOlF0F6BFtXCqLVrL1u2qfaifACvmHYqmWh/q6/J6LeshwAx
	uZHpg2LIcfYMPc5mqCvylzYSqScWPkPpD8QyMzed9zxq+WtU/l7cheMbhJZW14V5R7R5zOfWb57
	ENsJoXgjjxXYsR8OEG6Rjccq4+v0M6sbFJON70g6rjMv8MZzQZhq29/Qx/8cMLuk+246pIITsm6
	hwJcawmmTjA4mBRMRYBvkQSQPlo4HrD4D4bKLwxbhkY7vrhUKNhNns1QmS9ysuex/qdfOL+ws7H
	jjpNVcpiaM138+2+FQt3ouSGtj2WCEtetNL/H7Y8rAq273rTpG7wxQz+SDufYedpSBvro/4CZ93
	KTVBYiS3W5rIVOqIX814k8ZGyX0ZvfxjbplE3i//YZndsWf+Qq/rfIXxbsRsJLJdJ+HDbTL/qke
	EIA6RDQK2WYjMiDoehO3X6lY7mGoRe3VmBJGUM9PTDLAqaVuEPgsb7Fl+/4M/zrwCoEjrM4bC4w
	//frOdyhBH5uVGye8vkyGxKv5fNNooO38UmRDTrpHhXGm9jQG2GjeZ1BVH6Nam8vyPswBYaD
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr59365875e9.33.1788591835143;
        Sat, 05 Sep 2026 00:03:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:54 -0700 (PDT)
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
Subject: [PATCH 0/9] docs: kernel-parameters: Remove ten entries for parameters that no longer exist
Date: Sat,  5 Sep 2026 09:03:38 +0200
Message-Id: <20260905070347.25902-1-kmehltretter@gmail.com>
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

