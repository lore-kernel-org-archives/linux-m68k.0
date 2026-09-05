Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A1394793
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601630; cv=none; b=busSPHdPcpk8m9RSLL5+aWYtjgW7PtEoiZ2uNPQpYjvv+1eml4RShgugJrCSp4Lf9NNPyMIvGj01mnblDMmximwcxE3+f/Tr+o9D4/n9u8c+P1a5yvL0XSpoUW42oeCKf6e7eE0CVXghYUmOgEdzyIVjTM6MmBhVM/XfsVntkGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601630; c=relaxed/simple;
	bh=wms6AZfW1NQQQYXunQIXu+RBL1p7oQW8OzJU4DE4KcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fCGt/FpAA0iD6kD4ejXUkvXsscOBKkJ2qsbxqBOaqTcy2AGg2huiQ0UeOLUxtODhf58NnrW+rKtf5a2x6pAwcIdD63bKAcbPaX1rVsBskhujGtjKFrVP3v2UR3DNGZlPktBfpyDqAKUVBw4D/3By/EtXFUJOmgWxZj1cPb/+mwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n//Dpcdv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n//Dpcdv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso13257415e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601622; x=1789206422; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=n//Dpcdvn4wMzYB4+gt4n7hqWSZSdq9Fxiz2qCpVKM9Ewzb572pmtP/9CRWDC/RneJ
         WvmgGjL0ktz/0so8mqee0+f27j0dw3/37rO1FofJvH06vjEGJwCVU2Zdar5g43jqvlMu
         ULgT0oOXkoK7ohfsuieMKLCtkKeb3sN5rjDifBgAFz9NHlux+uuXpe+bBjRx2j2Bmacj
         IS4VSUGx+3d2C5nZ5OmOp52gwqx+twZhcYzFvIo/1QsSkBzrlAmIqOGNO0wg0A26n6TV
         ydSYI2uSVxyYFxkBOeHm1meY2nWpb2Qw+b78iAwAxf3sGNZDmxvxbm3ecYYcgnG6jop1
         DsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601622; x=1789206422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=q0BdAI+YMX6BkVEJcmlCNGCvFJv3ZNOoO9Q8NICap6tKiL8DXp87lK0vhJeDuqQJmU
         wLUF6eTMltiPK/fEdQgNRyslUC0wr6BAJks+N7m29vJjjbt2zDDuMHP99PmKLjAkBmuo
         iKjkCoEe2xTZn83wAM6pRzA2Y9Jgu0YPf/+l/UiUAZfaEP72rdWDZQ0SXzIOUD8mmr0y
         LbxqJcsyfLBpVf00g/A6Rz73ONM4+DiLtltXR7h2t7KWAR9bISlhv9d8idS80TU383WB
         NLq8dJ85AuF7ODuM3FhYrBOHXsrGUB58dBsPgrJb0oqv/7KJ2YuuwPbzOPd4AIPkFUgr
         Zw5w==
X-Forwarded-Encrypted: i=1; AKwUvBwSvh2J/lAxpFpnMPDxkHs4NNKBvExuJds1+atEezGRzodsJ0GKIcfFXHyYIhWtYf0AK5p+bJ3lS1Yn@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mOZYFBVyqvldMMh4pyPMahqZxvaDiykHQo30rUaisT5sDjcD2m
	38YP3NqJiQdd6YC0T/eK10RIE6jzG58D2B7dgRhqZDlFrXdyxyHX1rq7
X-Gm-Gg: AYBFou0y5mpMerLkNlOqwmz9qgRBIVY4hDG8B6/3KDcaeHWAdGza7y0J71GnwHr/HN6
	ho4QWqks9tC0+O36DEwjsZzsPJ3oQ2oIiXWUsSLJOM+Yi3oYyI/qhdGeI3RSTfR/lHLeMtJr6Ng
	9gN2w96dA+npIWZ/jW960N2K7fTbyofZ/s1SrhUNcq796MDyvoWvyCFoshGZZ0HTiE6b2LiDdvh
	VVTVAAKloIndRMFpd7wwDEgKrBczLwRjxWxV46D8csIzUm7OjzHMK37BBM5x4wR+nsE8f1os6F5
	1Xg7Gf9kZE8in5AdX7NdJlP3Ln2ZNd9wLv9k61kbACPgZDo8QlS1A63e5OqyOPL9gFKCMeMNqhm
	7tO9kFPPbvpiiLm/4sh+o8yxUSq5ocjkZMfPDohNWewWWWYrt+pcAdPhC0b2bCc3+L62V08bZiQ
	uR6o3QOUKxOkC/Gu6VR77QLdvsXKNpbpa/AyGXp6vYydzt/AShvF/WQcimd0M4UK0NLuYNf4ils
	ZjOnptwSsgOYhjrJUV/GxwuAfhtaPpxNaIyaKZyZjIDhxfaJlOb1zRGrN/ttg3GG7BUVHdabqXa
	Gg6L5RP04PB8QDkvtPVzZCC2EihejJkk6uSevL/wb/vcGHOCYSHlHPGTZ/WNXpnVdwU=
X-Received: by 2002:a05:600c:138a:b0:49c:fc6e:8cba with SMTP id 5b1f17b1804b1-49cfc6e8e34mr84919655e9.30.1788601621962;
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
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
Subject: [PATCH v2 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 11:46:41 +0200
Message-Id: <20260905094649.41996-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

