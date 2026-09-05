Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AED3DD522
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591846; cv=none; b=QAeYwP/tDLvOaGJSvi7PyJWGdPVkAIWozZKCI0hI31b0t38lUylIr6JUoP3h0eFrm0GB7Ez4pV7Szlt+QyPqhN61s8xT2O8GAQhN8Sd9tHHOyEwO4u6V6iJogOEOvuQqt6LKxhV+5Eu0yhAOCP8r+Lw7dfn9hQel1cHxpnGJckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591846; c=relaxed/simple;
	bh=BaEoG/6SLaF+j+PN5tp7+Wdp37OedR46Vcq2/qxVkD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AOsqcZGADc2nqFVm2YmI8SxjG++Jv1hXUZSzLTj2CsWkP4SrQeFggNS2N9Hn84MY/LmVp816LYPAiP6R56zBq6qmzOZlN3cGWC2TXhyoHWzd6htM3GF/suLUrHpa6nmLNhvH1Hf73RovxJfQLOIeEIeXd93vlI7xSYOcrFG26Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WODOhyLg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WODOhyLg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso12329885e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591838; x=1789196638; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=WODOhyLgM/768wtEiRJRk8502XPe9QSbMf1FQjW46Zd/IeoivJklEun7ddxvRqGPAs
         quv7Z3d3pXOwpkInOFWdoizbahB1zlmPOGp4X0tsc9GmyJr9aO8oS0bhh+Btsr8mhVhp
         UgBdxX9jOoF1GAcxgVsPqB/+CG/p6rq+DVgx4N91sWxCKXhof65eJN/lnpCGnfike9MP
         FhOcJWron52hpJuDjvaqXu2AWzHjxeMgi4mxYiGPpw+putFLgAVU99xXO/IswBm9oaMz
         wRPC4qSgZIrqcuU93LP8gmRkYYCHSl8lKR5jv/s8Xjdk0D2de4v9ZgKXNyhPi/yEG2Wq
         TOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591838; x=1789196638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=W34rQqAfxl9gOs3dv2wyY1sO9r2Ni67q8kXZceA97jq3GQph9fgee2tBfhHbMYw5ft
         1X2EeZe9aTVkjYbgYXXN4Cm5MyHgyTrkVIfyQztYxBENla+wd39F5f8O8AtCwG4Vlkw3
         R3DAdrc4JF80qFZ/4QiK37+rH2MAL1u5w5iVtAe9xLHZVyKInL+Xm6zwaTKt6jZ5hozJ
         zCiZiQ5vRa5WHN+6XMSiJ5PWbKbjDnM9Y8MohdmViuhB0PUjy0nQXfCQuusQ43YgPeYc
         6lNZGL4eNUSDZ4NrAppHbZtLYrBaf96k1O9w3Hm587Hy4DjvU4H+I87dJxYfuiBOJUQo
         Amqw==
X-Forwarded-Encrypted: i=1; AKwUvBwpHUTAi5nbXtXjTU/MMszFPEE8n/VU7qm4Fw3bpJ9hfPCT0DjITRXK4Nb68soIuB2dUiBIlBHxUbd7@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lgx+oNkN2GlfJ5hnoSIglCOEl5e7ttJw+9RFiz7AE3Gch5U5Vq
	XM0hdFCDkYhUwbBxFKv/Lx9/fYAn2RS3D8kw59cXrTFCX7VqElxG19/k
X-Gm-Gg: AYBFou0re8bnTPoZdmEsPuBiIlziedPt5qLQmHSiXSKfMAEpAVWIM2j3Djb+kZyCqcR
	8wjuE7S6WVGxckNPJNr+dDIObKA7QfVBfPnrGSwL//XbjDXqA00QC2SmYwGt/UaT5fP5dCBVBck
	7151VrnqfYEdChvNeWDUoMzEES4MHx7SOoZSh7ggwceBV4sQquIXIl5pPeo2KYs4WgBx0ebxNQJ
	7XU+8k7/hBDm+Qe0VCOtPE35F3kJv8QvG+GrhKQfGEvxIj86JgvSSof3tp4qGyVYVaUhB2+knnu
	j5JMPXgn4VMe3SWAyGuhjFtd6+/dzdVSXMXKeyyR7LhDLF4+wOuo8xO4H7QPSoXjqRrqsh4x/B8
	vHK5u20KoycG8b5VWEqeHc2ElHE+zb3MGa7ipEZQlBzeuzGwpFXTN0ybV59xKTpG6vjEzwG/zLX
	BaFNMNAN4i7afdz7ued5u2msPWHmv+DBTyZYlFPy+zkg0B9zzOYi+XdodNcAO0nVJ7QSVDBjxqH
	32WXdoV9Saomk4806PXiuz79lpWHPW+P+0MG33dcdti5TEExtshho//gKa1m57Jq2nuKkD7++sw
	+2NQ38+UwO3EnKRUkUdRLNpaGbFbykmKCZbNyi333IlSnNygO5cceUD8M6hNrcHcsgN7yGXK
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr97941975e9.13.1788591838387;
        Sat, 05 Sep 2026 00:03:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:57 -0700 (PDT)
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
Subject: [PATCH 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 09:03:40 +0200
Message-Id: <20260905070347.25902-3-kmehltretter@gmail.com>
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0

