Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603759;
	b=fDSagsiDRzjdNw/2xaYeNQFL8Q8cHAkRXBvbS+oKEvpRbxkChALsrxfjVEZWPkiuQ1QG
	 SIJjZWMok+hanfHK3foNibsbQnyTPjhGR9hYiBiVkRTxtqsBqZsNy8KIFqS5k7jsgVQql
	 VOxtsX/+5kmE4q1jKILAMUBDQ1yZYuQ0YShbzYa8FZlbAO82qdSEsBZ4tHfPlWBSsrNYa
	 Iht33jpuRlwA8Ms/yJSd6DQEZjgPDR23G6PQKkwdaKqt/PA4HvqRck63yYZ974VI+pOd/
	 Sr/Zcd6mI8Kg+jN6tSYIwpJn13T95iJzbV8rvq4wEFjFsOCeA95byTucQlgRyP3WW5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
	b=4+IwRwMs9AhtbdNDVsJH0UCbevJ+KQs57ctCpAu6VVGxzv8+V5GxrUFK8vOgyBv3U5zu
	 4g6V8s20jhMuIYWLLRdnGCMpMU5GIiY+XfChiXNHwM7Op80f3ReuuA5Hi9NgEReOAmdZU
	 /XuaxSML109KpWiT7Z/UfenpuUOUuEo2xfgc+XKZwIhhwUhefORnIsuy9CAA/NtqwidzN
	 1TzGNU9Xhn42ca6C0pj/e8zEsxEk982QbIkdRestNnpNddG/T0rXE/Xv2LzxoilhWhhE2
	 Tp3kz0EkwghEvxNO2zD3PS1yIbhAcEJZ9yZlbJ0kA8GvIK1VHZADT30k0v3bKDQtbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WTs5AFMk;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2515A606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2515A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WTs5AFMk
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so759597f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603757; x=1793208557; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=WTs5AFMk557xVOc6a0fmpMiFi72pZFRnRTFXA4TSg001xkIQlr8DbLzhVaJmSTcZ/8
         jURNsy7MpwhDb18FY++QUEPZ3ECXuPepERc4oNgyYFqiUi7TGnDEzn2PqmKEhghJQeFO
         ZpCwDlznRMU0rZ/A4Lcq7YGBxsWiGnrMM+Tc8MA8AD4uTTxtv7kHd36C+2hocj2ueDsg
         sJdbiPohsUgSXOFoGb/milFSxJ+roFcbKm4oppGIOWVP5SuRIwOYMQmPqQvZcxlcxpI3
         fZLEAPjV2F2wXaJyv22YGeE4A1CvEzIwUxMDRTE85KT/yO176eGYFk5HCsdk52a2F37o
         X0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603757; x=1793208557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=p22JOoT+DDu0iUxPA2HY8m0m+QzBlCVd+bvUDUE9Vk9OyUHlbYdOWe72eDYJ5WrkTb
         6BOtV/882XCOYgvqLTdi/1IEIax5QujgQjIM/ydpn8dce44+BsdJHLRM5pj/aMklMiH0
         1xYb7DIppWnCOzgPqH8S7LEN2Nlr8GvKdi9Ffl7EKDUC8s76WgdDaFX5/ZK9aPn40iZe
         N7cvCArpjxRgP53Va+/BiH63+vRlRyoV141+ofj35LFRwEF7pViim48etHvuSVkZvRMG
         ZQ2To5VNZrrm3JgO4QD5PCGQN4Tcm85+ZrMRXEYGH3gqOfZ/tCo5iLYo82jr+gZGy6fM
         QhMw==
X-Gm-Message-State: AFq9FYIpcPmYSAgaTO8TPP3YgSxGssxrru/+OgsxJk1Y/3mP63bV2M89
	ZdTbbJE9YjqPcFJ3jHCHWsPT4r0DztdWpqxTwooO0XBBfCwGRrelKQhzpNShXA==
X-Gm-Gg: AYBFou2bZPPqp96xkZp8UFoy0ko7mok9zB0VxRhNGYHq74fW4RCK9vYpoLdkO6UjrON
	HXbife+2XSP+YT2liX/IQJmQ/8nMBcrSL68YIqIoBPWqd81PXHEnhCFPAvt+CgjQ5n1n9nQ4NeJ
	uJSVQzdfA2MkJPbfQtDN2d2OlgfcW8E/zk5aHYO1zJCYBs01a1OWf+9XtaQUFR4RTMk/v84IeVx
	QO5rlVtaQoS+MLFU7rQBn/4zftJ6hRg4w2l7qhueM0hLLIm3sNKkQXzfU62EWNc6DyLdZ5c4Wmw
	1J4RdsxpfH2UZIZTHvho3RjRTqs2rwSoZgXJy5TPfNc/SQylliGe1aE2ZXyd/jO5aUEE5K1nqWe
	SE7F1+nX1K+bq5BvnWsz3F0mtpdMlM+Dbb6yo3TdiHDTHTpxvi/BexJZlWZUAQxyWsYD835XrfZ
	FGaEqmbJs4V52cbpZz//gicm2r+Qhao8gdSL3KA3Qz85BzIxtW8HiI247VaIcvg/UOiczBsISTH
	VDwGL9B8iQSbqooXiHvQWMh9RPBKNsKguAhBFAA1IFXl1w9z44T+dN0m0qeeIen1fMDgC345SYn
	or8eCOHCz7f75QatQOKyCYJ1L7lbIzoIWPm247Kfgf8OxS9oEqGx7vcRE4Xs
X-Received: by 2002:a05:6000:60e:b0:48e:2b82:e833 with SMTP id ffacd0b85a97d-48e2b82e8b5mr1782571f8f.21.1792603757378;
        Wed, 21 Oct 2026 10:29:17 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583522esm6987404f8f.35.2026.10.21.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:16 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 3/8] m68k: defconfig: enable WARP_MFD
Date: Wed, 21 Oct 2026 19:29:05 +0200
Message-ID: <20261021172910.134838-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021172910.134838-1-p.pisati@gmail.com>
References: <20261021172910.134838-1-p.pisati@gmail.com>
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

Enable the CS-Lab Warp multifunction driver in the Amiga and multi
defconfigs, which pata_cswarp now depends on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index e2d474e8cb8f..75d91d502545 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -20,6 +20,7 @@ CONFIG_AMIGA=y
 CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_AMIGA_BUILTIN_SERIAL=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 1bbd2aa653c0..120dc68d492c 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -31,6 +31,7 @@ CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ATARI_ROM_ISA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_NATFEAT=y
-- 
2.43.0

