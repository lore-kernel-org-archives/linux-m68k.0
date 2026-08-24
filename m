Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3544683F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585626; cv=none; b=TXf8ctNIsmRLpKUWRumCHsI1I+PclaW37uLWlrezA/A+G8+gEUwx8PTXGgiy+7fDaL+ou8c5AOlg75FANaaNpLd4C4auEZWyWFnyAVyw4z31r7TiMKxeicOJWPbVU9adY5UeGFKZwc/tQfDWEOHY/Z+rUPGXs/+unjcGgO2P62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585626; c=relaxed/simple;
	bh=irdB/N47x9nup4ZMgndI4EluVE6a9FeuoSZgv14k2Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgXrwkIIhcYSf2rBCIu/UMIhWuIa2+ZSg2yeRo9MI8fpy0o9Mvpajhk3o2UFGGi8vWJNdDPYNpShvhlOjhk2a/5uLAD0qnwcmyMzFEzTYtmLS3vMLX1VWc4c3oQvMHE7277XZ48I5Oh9aqbVAqa/HOE/KHFbWUSyCYP1Wm+JDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qz8zDkp6; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qz8zDkp6"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso5939902a12.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787585623; x=1788190423; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgiwGq3XgC9ihO7TtDGqqTNElH50GlN8o3qDtfDCcug=;
        b=qz8zDkp6y+saxvfILsyrRX9QUUgfXLdfUil6Pm9ZG4AbGuguprCOI5dUYQqB9uWw9r
         5+0Egcsn0eBYOKs+UBBqYiVefKLp348Yhe1ZHw7dE376m+JWlChlD9+cPq6jTvrgl44r
         2U8gZYZBx7CDWwcOO1zFLrtHAWQEBUwDYURVwgqR5N0Jd8fonBVECw0HuHAdvH6fgaul
         WePC9BriosWFH8aLQGHJckcwpfQ+6LPMOtpBeP2cLHyjILrPBFlDZbfcXLRaGG6kBVJo
         EBhPQCtcMZQAuMjjqN196F4QabIf4IdtVERSqWWrJeWjQ6pH+ELQ1StHJGcU4lvf5zDp
         KUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585623; x=1788190423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mgiwGq3XgC9ihO7TtDGqqTNElH50GlN8o3qDtfDCcug=;
        b=W8OXq2bKuu+B59RZVCPIFvcKcLaW/iVuBwEq5KUfeNCwFiCIho4HMsDGdOvXkgZ5Iq
         QhoR0o7xYJNp6hTs4cwxSV0CurtbCcaC5BcekRck5/Tb0ue/6YJmRcc8ogwVQ0xHSDA3
         kwesItTSyPp2c3SHb/+K8joCg0DU4DeCnTkU/XMmiAqyTPaNyXBU+IeHB7yWPV6joodO
         NCs9u0GY23Vk58o/zIU4J2cO+fmZJ/jARqVHlSg8KFqBQ7UY+XPkq7FCHL8noyjJXUbp
         KgLGL+EcM/bBVkFs7ee8PgtEidofxPtdilJw3dPKpT3drC7Qf8ISmklLkRuNB9hA0q/s
         Nw9A==
X-Forwarded-Encrypted: i=1; AHgh+RqfzUoXxL2z5RlgnTOET3JyFQ1AGkwV9H0MOSSWyJe3nZ3y2ecq4zFUufw15MxHgcZ6jqKwD7T0/Qgy@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kw7NZ7GqbqiAYIESRCGCza88JqfwTkPA5H5x4auLZznznI9O8k
	1HdCIrMebQAvMxlqmJjAMwjlPqXylPix5/mCvUILLZurwni2NdroEVUC
X-Gm-Gg: AR+sD10nc6ajzIuPAkAc6wtXnqEfnbzNUtSaoiSaEBozuMr+RV0MfFZ2uj0lp5jImaf
	Cis3bfylBlHiWgOkZPMyXNoukx/Fy8hMwr8NoWVO+HImCIzIdgSeRg72cjWsN5kA46IGOHv2AcF
	tslQMUGrxeeUd48p5KDgaWmuEj5E1bI5hoLvOS5jrNCd8WF0eAljbT6RVIWO5WbKKLQtdZugZvq
	O4PToxbxzISzyjv+4FJRiRSfJGosByd17/wyWiMjFHINtURt3MzUW4P7rVF5Of+5qTQ0Akdw/V8
	O2BGjAYcDaingZcd3e2JBFJGws99Ss5iliBDxWM6DAO1kMhRvXXtSdoTbt267NGqaARESaKOkT5
	l7+ZdulATKP3v4IeP7vzXl7n8RCgSSwGnYo50jxhvFGAIUyOcc7MknEEReQ7evGQVjuwS02NjVT
	pj9qwJI01BSwNSq4iATmVDB1WtrdVmIGOswowuw3LmHFIESWrXMruMa722A2l8mtBRDpQfl7pUa
	VyGbpntfNVtacNbtkku5+5WrTRqPlxwhSeNDhc72tlIl2yCtP0lpqYsgw==
X-Received: by 2002:a05:6402:27d0:b0:6a1:2efd:8687 with SMTP id 4fb4d7f45d1cf-6a42f20afd9mr28438487a12.14.1787585623059;
        Mon, 24 Aug 2026 08:33:43 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:5fe:e162:f6c3:e4f5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5b93f3acdsm2791355a12.19.2026.08.24.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:33:42 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] m68k: defconfig: enable PATA_CSWARP
Date: Mon, 24 Aug 2026 17:33:39 +0200
Message-ID: <20260824153339.512487-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824153339.512487-1-p.pisati@gmail.com>
References: <20260824153339.512487-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the new CS-Lab Warp PATA driver in the Amiga and multi defconfigs.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Assisted-by: Claude_Code:claude-opus-5
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 5ed08e0fdf88..b769be5a0cbb 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -284,6 +284,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_VERBOSE_ERROR is not set
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 615e2dcad3d3..078d71e9b7cb 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -310,6 +310,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
-- 
2.43.0

