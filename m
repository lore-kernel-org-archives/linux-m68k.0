Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E74C7D
	for <linux-m68k@vger.kernel.org>; Mon, 22 Apr 2024 02:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713752992; cv=none; b=shbKEKfFugz1brfsTFKWPoRoXIqbKSxTIe/LPxu0lbK0TzuGe4roDCZqc9BgUXR+R4TBlNMv2Qf8F/g5W5vuP2jB6CNmrThYNsgKF/AMUSK2n8Ijmh1BP2Bly52vaRIFx6eEJRtqkRYScb37gbwMBRJ3AGKUa+j09pNcK+vRAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713752992; c=relaxed/simple;
	bh=m27wYDOjcpcwafWPcFwfjllC6WM++ZBym0vGCxa324s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=d83s17gHz4UmMaOlSfYTzV1rAiNWXA0pLzJ/VF98nbJORhcBUx2KBblOOFxarWbw9fYYu04E7+PuPUdPnTx85eWvgo4OmAiXA8UPFK3A0rSxUyqtP0Obc18+sxmXoyyqbF9smMYhnlH+4r5+XFLca4/DTBcdXFTo7o3xfoRDd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fg+Qvy8b; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg+Qvy8b"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5acb90b2a82so2654184eaf.0
        for <linux-m68k@vger.kernel.org>; Sun, 21 Apr 2024 19:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713752990; x=1714357790; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1Ve9+JCdP5iUHRQpQ+uDIQnqkHMnksdeyImAIoPBlc=;
        b=fg+Qvy8bEIB85jZtBsvQsSXENSIskkFN1pOb0IQjfItj4lKOUZ/OQYqXUb+MUUlhpp
         KQyB52iIPmQL9BNB146Rcb0JOlnRtFgUcSwrn2BdETksSFkt4g6NqQQ6/63NPINqeiEW
         XLaYIfSnw7npK310LQd1bUW061vpdPWPwXvymRVIqpSDYSRsIJNXQnqsn7FibEdBNZTQ
         DRYhKsIYLAHd7XNDHkMuGNSDlvvV9zDaG35oozi4dw46izh7WrWTOEYIWDAe5t1E33DW
         9LiU8S/9lQpEGwHzwMvBSc0IUpSViTc3RK3oDjwaMURTFqkOPvQHqU5PEG8Lqzc4KWB/
         4SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713752990; x=1714357790;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1Ve9+JCdP5iUHRQpQ+uDIQnqkHMnksdeyImAIoPBlc=;
        b=IE5Crq+0CRmtrE+/4q33Jw+AaphZnkrc8csPzD26e3dXmLHneLR0IY9Y8l57ukfKgh
         etBHqyNnpHkTFpjTeY1SNt2QdNu6n3TDdQkkG0oIk8xVpWNcDB0v7oC/40d+c+cFFNk+
         7qDaf0rb02vW44uzhDruCUcMoHpJp3ollN9fFmdrybV/mBZYn7JCjTtdpsnJSPLbCkpr
         EPfMhlCy055BCMMSf3joZhb5O6PIe4oZA8R7f7FZTDrxsmAcvC7QF6L58XCsIDZWCVy3
         AW+qR1CKwLO84D5Ia7Tpaqiv4UjXQcpacyskIVtxfi6+Zi8Q9gybHsPKQ4WT20DsbjoA
         p3iA==
X-Gm-Message-State: AOJu0YxmpmAUX0o66zPW/JtR1M51rsu2OsyDRlogrub3s1uLq15fHp6U
	qb3JsEWYBXDtiQDILTKDR2IPeyjHnALpuaW7O3X7NyVKZCtSdr1lzk5Xag==
X-Google-Smtp-Source: AGHT+IFhyAdpN8cGHa5pd8cbu01q9bTGaEyWei36jm2SWSNbzBGSnwpXB8PN5HRadsgJ5UmMsStWlw==
X-Received: by 2002:a05:6358:c8a:b0:183:7ed1:8666 with SMTP id o10-20020a0563580c8a00b001837ed18666mr9726999rwj.11.1713752990290;
        Sun, 21 Apr 2024 19:29:50 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id w6-20020a631606000000b005ce998b9391sm6502566pgl.67.2024.04.21.19.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 19:29:49 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 0C75036035C; Mon, 22 Apr 2024 14:29:45 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC v2 2/2] m68k: improve __constant_copy_to_user_asm() fault handling
Date: Mon, 22 Apr 2024 14:29:43 +1200
Message-Id: <20240422022943.13775-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240422022943.13775-1-schmitzmic@gmail.com>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

A problem similar to that reported for __put_user_asm and
__generic_copy_to_user exists in __constant_copy_to_user_asm.

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
index 64914872a5c9..0671df8c6b59 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -286,10 +286,11 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
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
@@ -301,7 +302,9 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
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

