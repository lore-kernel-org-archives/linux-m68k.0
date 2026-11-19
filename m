Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091983;
	b=P4pxlpqAKfDXV3s4iROBzuQedgKBWBSwcRGXr6ztqNOOmx34qjq6lkMEOu4Fh2JU4cr0
	 nmeGM8bKJQjC7pAVjbdRpiRbDdbQToosqQXG4q2Ob/yVnC/1v0SFXQKqoaDHqmaB4V7RA
	 Egbuvq03Op5xknGMOdbZFxV7rEf/sYppnmNS8E6RgxXye5hWZmpw5CdX94MRJ94LpxlLR
	 ATzJ97EV4leBmHicVe7mtV5VKGzJEl4Sd12/VzSjJkHzlnQIOdY5jOJOLnygUsdmQth20
	 2SBMiJWZJmXq+Zef0iSta5UgMX5Z7iiLbeHcJwlGe7o6pfipNyDzFr/AywCPKUhDScQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=87LKr20k/L5NegPnS/Fj9m/aPduFPJkLQyVN/rqlEz4=;
	b=IOobnTU66y5SNr3jrQtnJca6DFjWR//qWcKn+5GBhD1WdzmBQR1844Pbatbd1ENVSPdg
	 w9DNiAnd1Kaw9UTOWi/1W12AJVLZPWgFTkNKZe9i8o2i7geZhTfTbGNt7LTrjHQvAjcJ/
	 BNDx21oo0RFP3i+rtHrBoSXvIh+FFilJ5I34I6AT55nTERIkv2v2s2eqlGlZIUwrG2eDo
	 wuoiKlg4LZjHQIPXrMibA6SIxuF+c7BYTS36WIWtouqmwAKrUV4Nr7CqMwyVfpGelyXkf
	 o/wKzqxdPsGayemGxnb6B0LZgVndNW63DoD9axSkYwKnGsryko9Ttuis/hvq5guPCKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=mAAb5NFx;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33CC60A2622
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 12:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33CC60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=mAAb5NFx
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9e53d011eso17566435ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091982; x=1795696782; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87LKr20k/L5NegPnS/Fj9m/aPduFPJkLQyVN/rqlEz4=;
        b=mAAb5NFxdQcXpQR1x9VvZRP+Es3WzSnLghaIxXGeSX1Ut8UcKxZVSmO9Beu3omD9B0
         QwWOvktD6if9PDdxd8hz86egwaJXD9iZBsQlRfAddtq+AChZ4+QYUtC2rel+lkqmM+QE
         0melvvFfFZuDsyGRJtW0h0ITssRIeEdXCjJHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091982; x=1795696782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87LKr20k/L5NegPnS/Fj9m/aPduFPJkLQyVN/rqlEz4=;
        b=CkpkCccpAqnWbnW7lDckqo/OmQ3Worxreu6nPQkHVmBOBCXMIAXeh+3SlLyDc+HLH+
         ynWXRzxgh2NaQl9tjO8Gs7+UwYzv7pRKWvyVQ1eneAGWYs0YagLLG0N605PEVX44xzU3
         5iVu3BDNFVmwqxWBt0UsaZliGH1xWTmukPquYVADcbfkSVFCg74AMgAE4I8ub9of+qy1
         +xUjlHT7rkqr91Gz/sesNWLr8uWIhklSuLnrOIubWA18p/kqP0nDY0lDOwg8PkutuCkD
         NB8EvKkFRaLiL9eFr8DIDjRp4SL8iSmynIGfWkE/MDEaCFF1LP74jg9EiHutxewTWSO9
         /JCQ==
X-Forwarded-Encrypted: i=1; AL+hErF7y9CBy+RC4nTKTbow/XybAOjFF/tnC04IkZSsO2pazmmoEpEjSBX+xtezAQKs/AwirrUm+hTa/h5a@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/TsrlY3sTHrUzExR3KlpLWVcbmOLrp0sxrqyAUCj0asOmWKUAr
	W7+nKkOuDK9CY5MiUqY1eIELt7pPiGJOP06uP19g6ZFKDHmJv3mDTsKanilswH4+TP8=
X-Gm-Gg: AZFdTZcpH+TjTTrSwn/dlEaz5IwewBTufy2gGy8Qs+X/ZSphFMd1nZ9fHYXRJlKcnjr
	RQ1yOqTB9RaeN/8YHwP4gPeieX6Gq+WgAGmRv04MTyIAgA1NaK9HkslbUc96pAmBp6Bdb/xjGXH
	mLd1dNxoOqxOqz6sEQehrzvqrwQnzQPdUeUtRboFMOVpqGnliJ4izJF8eNpN0MCeTiORJtpO4Ii
	6II0dc6uqOh4z+zcvJUmmPrXQAmUxvOlwN25AmjodJ6aslgoMCZm8c4odwmgxCrHEudYz1lpTEO
	/CzrfhcdHCUptIBEd1C2+3O68DBCPJEAp6n4F1WQLie6Jq0zZgtjCUFjubuRYvc92GmbPAl/Efj
	6FKTz+3qs6ZZ72b6sEbT5UzNp0EMEVfDeZ0o6CdDlt043MUTV0J3QXU8UgUyJZ1cOJEADWuZFRq
	3+VVay44Gbn0jnyXqp344DOy1JAgepKoTz8kD3Yw3Hamn2YdPab/MC2oLT/weASrrojhikPlmhp
	LOrguyRD7ZryT8eU3nWk3mVmHAmiVkqebJDYIYpD3IfGmGQZ89NM26nkYwINsbHGbdYm+agawgL
	+ZFMN+j2DS2hA8v74LmWYSF6QQ0Ib0RojQ36riHP8p81HA+qD233dH0XLPfVl23A58sA1aqa0Nf
	WyeHYMZLBtZssI4s=
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1359687a91.55.1795091982067;
        Thu, 19 Nov 2026 04:39:42 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:41 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/4] m68k: Add 060 PCR info to /proc/cpuinfo
Date: Thu, 19 Nov 2026 21:35:54 +0900
Message-ID: <20261119123558.2108296-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

Apparently the rev6 060 can overclock to ~100MHz
but mine seems to only manage ~60MHz (I wonder if some part
of it that other OSes don't use doesn't actually like
overclocking...).

I started to wonder if I actually had a rev6 and noticed
you can't see this info from /proc/cpuinfo right now.

So I added it. The only messy part I think is the FPU
asm changes to stop m68060.h from breaking the build.

Daniel Palmer (4):
  m68k: Add and use wrapper for FPU inline asm
  m68k: Add and use defines for 68060 PCR register
  m68k: Add helpers to read and write the 68060's PCR
  m68k: show the 68060's PCR in /proc/cpuinfo

 arch/m68k/atari/config.c       |  7 ++--
 arch/m68k/include/asm/fpu.h    |  6 ++++
 arch/m68k/include/asm/m68060.h | 34 ++++++++++++++++++
 arch/m68k/kernel/head.S        |  3 +-
 arch/m68k/kernel/process.c     | 19 +++++-----
 arch/m68k/kernel/setup_mm.c    | 23 +++++++++----
 arch/m68k/kernel/signal.c      | 63 ++++++++--------------------------
 7 files changed, 85 insertions(+), 70 deletions(-)
 create mode 100644 arch/m68k/include/asm/m68060.h

-- 
2.55.0

