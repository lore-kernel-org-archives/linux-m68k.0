Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC7364931
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003984; cv=none; b=IfFqQWS1oJ6Jck+ijbSztK2/iDetaw+ZIB5gi3qjyzTjEGSKhdQ5IXUB6+FToJQDq7ep3jbaXVxRA2RJatSl3p7M3BixtkTIg6sDZfCn+r5lDOPPWbQH0bIUXLAOTu7bVBQxEyihuNw/2+uyS/yK8h3xK65+1io0xWCHYcy4HVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003984; c=relaxed/simple;
	bh=GhxAkOxBMRZ6zZ0dFT8xEiFSpjQVEMyU/AlCAWxV42c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rJqsd7W0u8vw8OXiOUnAATOMbbE/3dht9PaD3LUyvjtNtAnywuK/zzVHTfwH/xAto5Nz0bhkIVBJ269hqxVVADyDjiD1DJGf2iOpkDDJ1PWJr492Uz03/BqVbWjDCuMeWvqshrnz/eSHmOuuf5ib1jqHyd3ZZW9sAuhJMRuHn0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7bDuBkI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7bDuBkI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49954b88fffso47527395e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003978; x=1789608778; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=;
        b=O7bDuBkIjrvP3aaGIRmsL4H92EmX1VX9SVSq9fIkIeYxoWNCc3HncGQUAmlVWHDJnP
         +K87sQwXBhB3GcCx6pm6khN5PS2yDf4aXvmxoBj6bYEJeYdSqqkE4RKn8Z4ptD7wHQJ8
         9kP0QsGzVwION6x+GshvAiY1rLHsC9N8iWDiP89L8yMOatrYnTg7afdK6J+Qf3eLgbbi
         yAbFsAr0EIK+U6b/KzqZ0wSsvg9hk8BXS9KJQEnusma+3TGEaiJdYQ5oE3GW4Qj57FgS
         q4tVjImG0TnYy0/HfVztU7RM1nE8Z0PP3zF4+wruSPpnsLMF4loQY3LrRZcWhNz2HXtz
         52Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003978; x=1789608778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=;
        b=ZFSSzaeJwsNAup0nM58W+/QXVoEF1ID72ipwFoMhBSv7BlGElonANICLq7S/k0KwL3
         hAjJ2rcvDi+vUbJE/TkxkJc7bIsPgoaWVC+z0DMuuQN1cqltJleF3VBUB23ppsCKxI7E
         R8pbd598d5U5g5O5Jzlp87v8eRT2qZBog3bthAtFkgSwNvDl/Qyn0cL+0wLEQff2TAHX
         k0+hfEjxhhKAUDu+1sPskhfNj7w1mch8YwxLNRxqCJ+HBdMpf0TzxRXoVdXxZTNewS7U
         y6Z8Jg0I0qw7pZ22CUmXvZgmSbH0WRThufCFaeT0J6THKzGvo3/4L9ut0kxMOhFR6QCA
         5wIg==
X-Forwarded-Encrypted: i=1; AKwUvBxB1URKnWV7HIy0Eu2KN6Y73B4clDL/dDtNAnEKL/k1C8dPiSXbcFSiKvFgUzGBoL8q5/l1tVLyNidJ@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kxoQyjqlpQz5zs/zKfpm4AO26d1sxdvhT031A42l0ejkoc8qDa
	mdmbhAjlSyZYgxjmbFo3s2mamqOSgNkXb055lXhHp/v/T+QY2dUYxKVt
X-Gm-Gg: AYBFou0FF2vM0sHR6Nbk7x8Em6ogzw3id8XNbjh9O6ihexhlAICtWMnFWB9wkwlwdJW
	SYDdRQFMV8zCpHclUZUcsIfK6K+4iugUbKNu4BFuVptHeFxpsXQSbDiaLYRaWUXNtAF1KEugb+o
	gg2LaU+PazGD8hA4PFVodMzpgWlv1w0jnWOBtVgW+E00HX/GCVIYJPc5lkeW1MHaohn9EltrM2g
	We6H2ZwntLoGXNDDwW8ysqKbo9zJvM6DPuX2B5WBjygxCbje5MDwpPqopXyKgmiuTL2cUHkjBFx
	gEjYp7cOSzIvCqvBSsAzPvaY3A0+DunBKakKflJx+JZdwYa2HdSRRAhD9lheMGjoua9eHbDt5C2
	TpNTfEQu26HOxeKExhoTt43mS9pQkUSLOTqdAf+IP4EfuRwgsP8rWc35ajcGDxrxUBjqKUK6gwr
	U7BYSWAMTpWIvPfFTEoefTIfO04ElrD3n3pDVfTkQPeKzeaplZsyGuSuNJIcchNI5z3ebwFSevt
	qHdxzJGSyj0S3HAUKxFnFB4zWkJ0SUWPO1Dpz0SBE9Zk+jN4bqiP/n0Uqn10VB5Ulio43HV0bCo
	rjuecEb8wu9FrfuXB+GvjVtJoTIB5QOPlxcZGUo//p1lZC/bA8SMko1vzPRpZcrgMepNjPXInq2
	4qg==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr366891825e9.26.1789003977900;
        Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
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
Subject: [PATCH v3 3/8] docs: kernel-parameters: Drop the edac_report= entry
Date: Thu, 10 Sep 2026 03:32:40 +0200
Message-Id: <20260910013245.8619-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_report= became the edac_core.edac_report module parameter with
commit fee27d7d9788 ("EDAC: Delete edac_stub.c") and went away with
commit 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks");
nothing parses it any more.

Drop the entry.

Fixes: 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v3: name the right commits, Fixes: tag moved to 7fc0b9b995f2 (Boris)

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
