Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA3879F6
	for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714360196; cv=none; b=O9KvZ5Nl3lzGrPsizza1J4zQkcG1HW1GzTnmW9eYFI94a1kFmyQ27n8gW3JWPxW89lvWDaBfBv+eH59P4GKHMrbkuW0GEVnlp6vw0XdS/b8TKqVHF9zFivn+8dUf+Z8+WNpReO59pPnr/ILEbhzGEG7BQkYw/orSaY4sJ08L/kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714360196; c=relaxed/simple;
	bh=JIFSdsvbiie9pOCWFdwe6P4wG6D50o8Koq8ZKlWR1ck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ATpVj9mmPmlEX0soqwyx77T0VTm9g4lvxjmKRFsQwZia/7I7ghNxIsSb/oL1pQkY6rtvfmU3HHWE2qaUJFQ7VXYWFSKfk3lH4Wk/tQ+2U0HyP0txjltYZgT7ZukiybIEQuLKeK2NCz0f0EjIvfQNW5uQWd54N7r3GJt9FB8Tefw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8dyTpOi; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8dyTpOi"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ea1a55b0c0so2093384a34.3
        for <linux-m68k@vger.kernel.org>; Sun, 28 Apr 2024 20:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714360194; x=1714964994; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g5NuJ0lP2eMxXbA7NsUYPuWaFFYK3TAMSrVwMUo9wWA=;
        b=a8dyTpOiXuZLy8IgJzeJA/jtMqGIE97Bn2qbW3bvcUPSgW1inrRz2XzcSCL6y6Heyl
         92eMHdZ3KSYwHqtIxq5xRk3b67DTZSLoWkFotgTNqsy4nq9OqpRa1WYR2S27gcEBph0h
         jrfYQ6V+t8/hMgUxxIIR10tm8TAMoHDKilYQ3O5ot7m4adZbbxRrAbNg9oZlOyvO1l2O
         MmSKeS7icifqeCfNBu7yBcht0D5801R53oelszciV/SQdW9u5IBeKCPx+bJjPUdRwtda
         HYeby2rzGSKkYG8BTcnN3Wn8WC7Hr0Tp7nAP0/W3fgFtaMxNIw4S7raOC8bHP/N3+OP0
         WRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714360194; x=1714964994;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5NuJ0lP2eMxXbA7NsUYPuWaFFYK3TAMSrVwMUo9wWA=;
        b=GNCi8GlawKwfN2xgwWMn+voyM4W38nW6jNaqt5m8hRwVORGnfcB/O2UIigSFnU4E1L
         6gMxg+jRTS/ULRJl4a2SzCv4oi+9Dv5U7Uu+w2Cj2RdwA32rpot7upjMrAcGe5ncZdsy
         5Hy0OqIJocUNumL6NnVU7JjWp1VM6E0Mm3ZPfbSBvXYxR9P4wyu1C0SmwD8baEZ/1igh
         qVlALouhBexCBIUfL+PDzr6V4U9DM3T9utjvgzWs1pVWevk8x3WPBZMD7BVRIlIJvqbu
         ziBPK3hsj7aXevRaqmHvoaI6c8HK5SKZFLKkkawZbqdtwRh//TAMcEWk7UU8lR1Z+sha
         cKDg==
X-Gm-Message-State: AOJu0YyarXenYNB+yRhlQBp04U6CW0frsDglniObEVpABG8W+J/lsoxy
	0zl+CKq/6Hp5g93wHDC4a+kG2meOnIe1/s2m8bsrbNMpqD3DiI6YeZKaYA==
X-Google-Smtp-Source: AGHT+IEdWYBOV8ML1uJw7NAyDlw88fHW5PE5r4UH35gsvzWEuvbJqZPslUPXM6SaiJVNEBRDkh/2kA==
X-Received: by 2002:a05:6830:1b61:b0:6eb:dc85:6338 with SMTP id d1-20020a0568301b6100b006ebdc856338mr10433516ote.33.1714360194038;
        Sun, 28 Apr 2024 20:09:54 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id q28-20020a656a9c000000b0060ef68e3addsm3344652pgu.53.2024.04.28.20.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:09:52 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id C92DE36032D; Mon, 29 Apr 2024 15:09:48 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: gerg@linux-m68k.org,
	Michael Schmitz <schmitzmic@gmail.com>,
	Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v4 2/2] m68k: improve __constant_copy_to_user_asm() fault handling
Date: Mon, 29 Apr 2024 15:09:45 +1200
Message-Id: <20240429030945.22451-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240429030945.22451-1-schmitzmic@gmail.com>
References: <20240429030945.22451-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

A problem similar to that reported for __put_user_asm and
__generic_copy_to_user is also present in
__constant_copy_to_user_asm.

Address the problem by extending the exception table to cover
two instructions past each moves instruction, and adding a
single NOP at the very end to catch faults on the final
instruction (which is not guaranteed to be a movesb!).

Tested on 68030 (Atari Falcon 030) with a transfer beginning
at a single byte at the end of a mapped page followed by
seven more bytes on an unmapped page (testcase derived from
stress-ng sysbadaddr stressor by Finn Thain and modified to
use the llseek syscall).

Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/all/e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/include/asm/uaccess.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 44e52d8323e5..f1f4b62d6f69 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -288,10 +288,11 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
 		"21:	"MOVES"."#s2"	%3,(%1)+\n"			\
 		"22:\n"							\
 		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"	move."#s3"	(%2)+,%3\n"			\
-		"31:	"MOVES"."#s3"	%3,(%1)+\n"			\
-		"32:\n"							\
+		"31:	move."#s3"	(%2)+,%3\n"			\
+		"32:	"MOVES"."#s3"	%3,(%1)+\n"			\
+		"33:\n"							\
 		"	.endif\n"					\
+		"34:	nop\n"						\
 		"4:\n"							\
 		"\n"							\
 		"	.section __ex_table,\"a\"\n"			\
@@ -303,7 +304,9 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
 		"	.ifnc	\""#s3"\",\"\"\n"			\
 		"	.long	31b,5f\n"				\
 		"	.long	32b,5f\n"				\
+		"	.long	33b,5f\n"				\
 		"	.endif\n"					\
+		"	.long	34b,5f\n"				\
 		"	.previous\n"					\
 		"\n"							\
 		"	.section .fixup,\"ax\"\n"			\
-- 
2.17.1

