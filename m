Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895467;
	b=H3TgbhW3Wq5+l6kiyNJAHQx6sABYc57zyHl6wKpZWoGTBzqv1avLDqIZOagw0NxAwgrQ
	 SLXAcn3dGW49+jnMAzZ4z0Auv005Y5pf/jpwz2xgv9Cc3OcX72zkPMvJIf/Yub6wsNL1o
	 dgCnpqteJdwPQWdbz6VLEZfZgwqoq3l8W8DAszUvputL9snzcUBwcT8aZg9y+O12MHSea
	 Y2084Fk8Yq487Y/nmCbpkdbigAJjabvzd/GuwNTvmyd3Bhx/gFG1bBOVL6Zdvw63QNK0x
	 OzUc53EZBe/H9Bz07ZX9R3CqsqqvuenZb2e6ctEJyZVtO19quugI6fKEJwXH/PcjjAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
	b=E4PP83XJqs170EhhYUwnzfIq/nz0TQz7A4BAYophLAnC54kqEnxajluWGhIunksPfBcH
	 FAAMNjqA2PEf+3dwmPxmRSyeXOD+PpxXBybpZgSALWqSkT9bVc+6uGchhHYkKlx3ljuwc
	 SCMXrfaiGjysOcqbBMLItr9jRg1IUtBLsfc6Cfhqo7AfoVQR5qQHNoIDrBErBM2a1RbVL
	 Go8KChq9Y0Ut3tzM3mD1h8z6s1H3X9Nj1jGABu++oR3ZEASznD2WAA34CEMdI9J6KvSIg
	 qzwH2lGZpVvLh+mHEqe7OJsGlyq/+cXrR2QVQBAa2/Q5/ZGmCenrp8xXRG7SSM59nHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1jEWz3j;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969F7606A31B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1jEWz3j
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso902278a91.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895466; x=1794500266; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
        b=k1jEWz3j1PJWN0ckhmH64soMl1Q14lVzevpfpwG6ROtcjwP2MXWl9BsKnaruKxwkja
         lAqi4vjROHhWVWztEZurfmDYA+IV16ZcTh8VcRUnt7Ie6/q/YWd7102Smgh+3ollwsyZ
         a43cedGX0LAWhbwEL9x6e+pFFqn8sWQ2xm6/ejfdBaeoOLoqJARzZi+dnzWQTKcAtGsc
         Kji0ZH6E/bs9sfQ2RA8eXedD96fI54yP8BzQ8t4qfcar+olQhia6dsofF9RN0X6eZOtP
         r7QWyu2j865x7MOjfAsj9NogRg8QmEDKhEUgAOXMtIiMpvmPsrM0sDrcUlmJlSiu59eZ
         S+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895466; x=1794500266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
        b=hp1cMpqTVV5Q2uecB6iI/oF1C6JL+VhD56lLJHWTkbbTm4+12A/PSNfLOmTqq0HCeR
         0BTyY0a2fHLIipJL4oodrE0J3dCPnnP+/v+n4wwJkN/IWpua6zQ5MWcDdTTo78+NDA6R
         ksackN9gIyllH2Pcui+0LbL4Xz+8hXh9g5bOMJ6tvEnm/VQ3u+w/iH8Q1sb8OFeAlJPT
         IC8qZGftTkFB3uCLgT5JSAPgACrV4gfGViNR8bessD8OOSgoIyEjfoTSXP59ynJ5RXZJ
         x3ZDkHyvsOIyNxNFX3rQBUD0iu36fyyPAhW3EwtGlBL9Cjwge9movAGes7EzfSFL73CE
         MWCw==
X-Forwarded-Encrypted: i=1; AKwUvBwhB22E36n8H15oNmNR7YE8IgOTuUxiMzo+apg4LMqvJiaF9pNHvg/Mnf2ZEhAqAUhdSIJLDwg7vzX3@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8s7PjekaCvBRm4iEllkNkw2JOpR3goa3mOfhfg1avQ2GTeOL/y
	1A1uLAbaDNFZXL2tdarFXj85n4Hdn1+SsXofZq5ann/j8Qze8dQFwy8SnmtFQw==
X-Gm-Gg: AYBFou3VIz6LOQhAvi+brDkQGPyir2eD6zRG1s/fQ7pr6MGgdhdXf3ypFyOXJr6lRvx
	Uu2pKDV1Z01zB5xeqcPY2Z1EHZ4KPseLsG6PJfrAFZ1FI1xSpRWe+M7Wr9leXCsaKSv2lk853i1
	nhDeWpSqnzmXxGBCT1ROs1+jDe4EHssxwBeX1F3g7mXqdX5J8dr8adaj28/lSkexG4S0+Q+vwKO
	4v/8JM7p9hAahGL4Y+tv0SeA5Tet4gEFypFgty86d0aLdg2GmzisRZxlagpvXzPZmp9AO5Ft3W1
	y2ZbkmPNgpVB0z8uew8VcyqHecTss3J8T6PQO9SToG0OALYbYQPYS0GszboRfu8Q/vgYygjRSB6
	5mBOqBIhxFNDjNly+601413lkAj5ukOyUkfzawKMRj1UbzbN4RVrrAq3YKBw3DMXy4DpaFyX0ux
	XIKnk1Dj7QXuDEPq9sE2f1YAMcDfc/0UPlZ9GbfGkPGk8il/VGcwZ38PL2sV6gvX+cQNHxAmB7N
	Yy/kyUnMYU7aum4OmYqLFEr1F1pjIXov2DkvGBJlix49m+XRa+nKwuLgzUnBQSfgBNdUWqiqtYo
	UlWDedJIXzMhnZ6eq6DKZ8tnz0yQYkeBxP2ACO+FpkV/m1fIS/Isxtg7aSb6Kgpeak+mobGaclx
	H4JjkKtVF0XmROBSjlJYRtRs=
X-Received: by 2002:a17:90b:17d1:b0:3b0:9941:8d41 with SMTP id 98e67ed59e1d1-3b09941917emr5299410a91.28.1793895465780;
        Thu, 05 Nov 2026 08:17:45 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:45 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/8] clocksource/drivers/timer-goldfish: Fix resource leaks in init
Date: Thu,  5 Nov 2026 16:16:57 +0000
Message-ID: <20261105161702.3515900-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

goldfish_timer_init() ignores the return value of
clocksource_register_hz() and fails to release allocated resources when
initialization fails.

Check the return value of clocksource_register_hz() and clean up
allocated resources on error.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index b1dc8b388470..8c312c3a64a6 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -131,7 +131,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = request_resource(&iomem_resource, &timerdrv->res);
 	if (ret) {
 		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		return ret;
+		goto err_free;
 	}
 
 	timerdrv->cs = (struct clocksource){
@@ -143,17 +143,29 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.max_idle_ns	= LONG_MAX,
 	};
 
-	clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	if (ret) {
+		pr_err("Couldn't register goldfish-timer clocksource\n");
+		goto err_release_res;
+	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		return ret;
+		goto err_unregister_cs;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+
+err_unregister_cs:
+	clocksource_unregister(&timerdrv->cs);
+err_release_res:
+	release_resource(&timerdrv->res);
+err_free:
+	kfree(timerdrv);
+	return ret;
 }
-- 
2.56.0.398.g882cbad275-goog

