Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2D0446AD
	for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207706; cv=none; b=iOiWoCfpRFfBORKeKoMhzvljIbevPl9T37kSd5aZyw7OyMAL//HgBSOENaxP7iZyChKuR7GrZTyIaG0zbf7QJdnEJOcFswQb7Ycp4gttqg7hpLcIhPC1wOUokUTg5jfmomZUre3+Jq6vX+HB6vmMD5hLjjuOfigbIV8zcw+aN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207706; c=relaxed/simple;
	bh=mMybCReqsQKIudrZLlV+fZwXIBsGi08n98YWRuP7rPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RqOucjzkIqyUsQ/d16n+7SwZvNWpWDQvQlH22QgTyTJb30YRsciiPRp0JVFyXySPN0PhPMmF6n2KjSV62FRKkk832XiKGYyCK3CL1EEkTzRYGEt3gRfivJMgd3gSE/r15yJ7P7+NuLU5GzkDLS0TA0vOoJ5WK9T0xGTE0y9z+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enF/u68R; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enF/u68R"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ae6c8745ffso2020051a91.2
        for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714207705; x=1714812505; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ROJPWsMknhHHmSa4hF6BtrfqMxZzrGt4eeUvqsKvtc8=;
        b=enF/u68RVexnNtliId/FHe1EmawBr9EJdmpOZCcCjiCCAryxmjYBNFKk2WPU6hL6zb
         VKYy50tDepPiuLhY+UjxDtRS81wp5dK7rXu3K4hF9V0SEMIaxkEGRxF99eM4g3g9bmjI
         GPmv3Cbcq9SVp+4It1B4rpakZE4DWq5V5qGOTgJ8CiZ7a5Tx2jiZvWRzE6QqlfnuaI4e
         tcd1igrWoO9tBOZ+PPA8rSFXOBPTyCdXSaay+qmNzVtVzvZhteHjkYrKafK0FOjDjCRH
         8viRsO7SGPspODYNSuQDidNKwQmuZO+m9zilNMDkmqUqMoVSyvRiGUi7kXjFd8djhn/s
         MJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714207705; x=1714812505;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROJPWsMknhHHmSa4hF6BtrfqMxZzrGt4eeUvqsKvtc8=;
        b=P2qScy25qO/4yKUNJ7IW+oVJstep0ooWbMhySkTpGt2+VQ3YBFpLd//xZEkgwS7Gx5
         LSuJU7SjTyUvJ6+yzaq172lt/QaX+OzSdFWm4To2If7lhJCa/VV53JVNsqi2/rHZB8yh
         u3FJ7SaKjVm0Dcjy8+0awqdd3mHveFqcEMGvx+t1e3g07/Lutj3f7s6X50mI2JXn7yHd
         YxwGbm2KN3HscQOYf/PvdcGD2XE3z/5XqXhEeyuSb+A9iW3mgtWQA7uLlB+KZo2Oz7nS
         wz86T5PGmhviicO97NvTZkxeKF6eD9+ocJQk93JY/xy2+dAsyuGPWROYqG+w2YxzpBke
         A7SQ==
X-Gm-Message-State: AOJu0YzVDbzWBBTmqc0PdEed3TH8VKN4xNzEhTc/ptOo9qRcDMAidXk0
	Q3JisuLoVzDEnbr+P4sbqWspuT67H9ENxTjAErHC4QGBG8a9Tuxf
X-Google-Smtp-Source: AGHT+IFD3l6QpejVgfTYICJ0FRammQUsRCnI1vEyeqRhKZuOUQ+AQeNdgWMvKCbg1JAi2h38Rw2oDw==
X-Received: by 2002:a17:90a:654c:b0:2a2:97ce:24f5 with SMTP id f12-20020a17090a654c00b002a297ce24f5mr5178108pjs.35.1714207704654;
        Sat, 27 Apr 2024 01:48:24 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id nr20-20020a17090b241400b002a81d898f0asm17775342pjb.5.2024.04.27.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 01:48:23 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id E0B6436032D; Sat, 27 Apr 2024 20:48:19 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: gerg@linux-m68k.org,
	Michael Schmitz <schmitzmic@gmail.com>,
	Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3 2/2] m68k: improve __constant_copy_to_user_asm() fault handling
Date: Sat, 27 Apr 2024 20:48:15 +1200
Message-Id: <20240427084815.1449-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240427084815.1449-1-schmitzmic@gmail.com>
References: <20240427084815.1449-1-schmitzmic@gmail.com>
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

