Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC1D24C669
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Aug 2025 01:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754704569; cv=none; b=qr+45L0ji+CjALBzPFyHnHcvlMdfbZfbLhI4Pbojj1TnKrHm2csxSmoPgi/4TsWFJP+M6Ghda+TShb0/t6yXhlw6hBH+DSGA1SBl4vZDPizkUN38TYaZEUDmjBbChbES1s53aCBu08pH8DSyFQdqvV36dHIIHbn2GENPMYRQlOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754704569; c=relaxed/simple;
	bh=MYKaqM8CAHkyIRmw3YojkfdyJu+8WrIZ/Vqc5NhiXkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/LdhLz7hUZDaRL8SjiZVyLe05S/VssHZRNlHcRiLcxjfJaf50LO8rlVv119aW2vi7dzOq8O/wdOB2eoBGDspzOXgXgr1NNLBcwHxK1ADoztCS1KSSknMDAXyZcb8QDe8qi3wVwy6qQB2gCoB2JocnRsWZwd6Jc7s9UlE0kXopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=j5/LkZPE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="j5/LkZPE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b421b70f986so2042174a12.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Aug 2025 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1754704566; x=1755309366; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T0gEu9M1jWiqQ/ChUNqQXxDev3uWQxp3w+IDbpV+h3k=;
        b=j5/LkZPEqEgvSreBOvVH8ezW34TOO29ZjxA0Gdar57v4MN44LsIU/dJwljebTzwuZJ
         FCUiZLd/oTc7aFalYCkTbY7A2xAb0pvwRXLbQB3fXjR18M5ixzpGQYIhuENVVSr99zGu
         MaMN7af5zfY8gXC+oGYPyJoWNkZNNEzMUETbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754704566; x=1755309366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0gEu9M1jWiqQ/ChUNqQXxDev3uWQxp3w+IDbpV+h3k=;
        b=OUqdyWVlIFuhYWh8kPILabqaHzveAl1kztkKMxye8IpoSX6k5CKfyotsMOuXg5XXJ8
         fsy43tGNx1G6LF7Gq1TWZK2LGEbFzD6LNE9nV6Q/w33HSo3OZY6VLRqh8KtOqJ2JVmHy
         aCPVRLbEHWlaNA9VVE59kUqcj13fD1/pF+WwLsP23l6HYK31LTrQIFG43bwOXLcvM6Nl
         BLVC80NbGP7mJBmB3+NmA0bieb8dGaWWEsolcD5LxuxXH+uWnrRqD5QJdLUldzUFJGpP
         5Cz1m9pEmmSr2ZvXXZkzQJkhQd4OlhuqimLiReweUYW9tgLEe2iw8LDk7/wPM2gLNHqR
         IZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3koz3QRcR2duf3rXLT8OH+b8eJqVZsKudB5cQf6pQgFsUW4ol+t3O/bsF+FThM1nK51Va++kbiXpT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzaLJXg7Pj9XKJOzD9DCrsY4l4ljTfq1ej2xsrxPdLlNxXf41RI
	2/QbyRcH9Yj5xGdaHTX5eKqI64Q4B1s6ax8RHbWAcsZWxEwc7qknglRWxbJcfgnE+vA=
X-Gm-Gg: ASbGncsxrCFqjKq0ooIzULkH5+VWzw58UKVwuLrjgyr4K47i2XFd8/RIgc1e4feIWlO
	9rgso/+uyeLq0sR5C7G6n5ghgyzIk4EC0YN7bh6s3rejqkz2rRPyqL9XkoV/ER/zEuAtu/1kZnK
	Tsh9fxSB7EeNBQpytQHVXARdp3ixNUamjUlTKzOgldpU7qszdEZToS9UupymE+L6dmWVV2u6lA4
	j/bDUegq2cJaWehLvLIkZHUnrLJMYg7+IVENK6zslhd1XbPxHZAcptrkSzJinYKIjxieglrLLOL
	p9B8gmh4jXQ03RzgnJS+4LlMUxVfqJRYLY2tJWad5v7JPebbnEcMYrV3IS7nsHVlOwPHymsd+td
	0J2wfx4gIgDbiCOh2T+uxUaM1F9Q9mPVER67Wunl8G3viLxnXDNX8Od/JraXLF16yYjEs4vv9uQ
	==
X-Google-Smtp-Source: AGHT+IERjA7mv9VWNW+RynYLJcRsU6bRSQXETe7C9BCz+ad/Id+lhGtD2CjniX3rZywKY+yyxNgFow==
X-Received: by 2002:a17:903:4b43:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-242c2266792mr66416245ad.55.1754704565794;
        Fri, 08 Aug 2025 18:56:05 -0700 (PDT)
Received: from shiro (p1561006-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [153.226.109.6])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e89771e2sm220358985ad.88.2025.08.08.18.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 18:56:05 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: Add target for lz4 compressed vmlinux
Date: Sat,  9 Aug 2025 10:55:29 +0900
Message-ID: <20250809015529.373693-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Traditionally gzip (/bzip?) has been the compressed image format
but its a pain to decompress because its very hard to load and
decompress it in chunks which you need to do if you don't
have enough memory to load the whole kernel image and decompress
it somewhere else.

With lz4 you can set a block size, read it from the header,
and then you only need memory for a single block and the
decompressed kernel.

I use lz4 compressed images on 68000 with 8MB of ram
and MVME147 with 16MB. I want to use lz4 in my fork of EMILE
to boot m68k macs because streaming decompress of gzip is painful.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 0abcf994ce55..a56e853037c0 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -124,6 +124,17 @@ else
 	$(KBZIP2) -1c vmlinux >vmlinux.bz2
 endif
 
+vmlinux.lz4: vmlinux
+
+ifndef CONFIG_KGDB
+	cp vmlinux vmlinux.tmp
+	$(STRIP) vmlinux.tmp
+	$(LZ4) -z9f vmlinux.tmp vmlinux.lz4
+	rm vmlinux.tmp
+else
+	$(LZ4) -z9f vmlinux vmlinux.lz4
+endif
+
 CLEAN_FILES += vmlinux.gz vmlinux.bz2
 
 archheaders:
-- 
2.50.0

