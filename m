Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B033EE
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707100363; cv=none; b=Pt8EuO+8Fj1wcvBz8VCZnF8RitsspcZV5yfsuDuERZjjV+CNcSeIHxK64v3QD3fDXTSa722xe7KXbSOtJ4xdC6d63K/glrER+hI5PkvJarVIDlPHgDCwfUQXe0IRbzSMQMngkdMiIxXE7a99YHISmj38DVqOadQT8eGM9MdgXKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707100363; c=relaxed/simple;
	bh=aZQyzO+RWs46vrnUGT+1+kTTH2BhJrI4gMjK1l5XwTA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=OcqL/2rDQohcf5g1FIdOuZb6CvWLpGxydmZm0K3eoMxNQn03SMO1NNK9/wI8dVbSs4RhepQPSX252npeJZ5ZcGOlDmTxcZNgG6uuX0xlhuyOzkvSDFDBAsjXGaHj5CSqLGk7X6PH7p12eK3qg+Dzsy5Wpcxm2g1r5J9Mp/DpniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yy6GO1Uo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yy6GO1Uo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d751bc0c15so33993235ad.2
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 18:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707100361; x=1707705161; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7MzyyYFvH0RGogbMMSkZTf1hhiieHpOJepGOnXNPy8=;
        b=Yy6GO1UohRa1PcBR2d+/ThTcW+XFr+I+xUE8kBN5VqwYKhdmp3dh2MXxPfPktu8CH4
         9kdBtSy5O3SZDPSoWkGkgH+hCpwHaap28JAulDpPOjdoCb9+nrLmriBU/P1g2IVpSNOQ
         jWIqjNwZin+5q46NEOKLajYLmfEwDqRDv3u9bCHOPW3IdLM/T1cdSS2XUCtjlIwIl1yA
         kIY6ZWbihstO7xkgOIEB5mJiA/M+j6z7m0TZVyiWUJ6TOuiIlOSA1wAsGqX3xbhJqlfU
         eTxquGnQbgvhe6Xg8eAw1kImzI94teXm4CLHxNWyb4tW1/aYSYYmnaMMNwGGScJdAil+
         LbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707100361; x=1707705161;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7MzyyYFvH0RGogbMMSkZTf1hhiieHpOJepGOnXNPy8=;
        b=BRGy0oi8nZQIiPOF/+YN+r7jD/DQl4PFPTPsvcsS3gjtB+yYsTe/rTepjZMHUQlI4C
         SVR2SVLhYfUhSuRcGXAiimsOwA3TTmZi/IVpw/PRUCrqKazZj5sEPGTcBMS5BDZnzkxE
         8fL59HABRk0BP1Hvc+wJK+hDE7iJ+ujRfk9O190og/tpSD7ruAiVnzWVLnJn0p+A2ZBc
         +yQc84hAhM/9s7vmYnzVyvSjQFXDSUIvfss60x2J/OzlALsUc/ghKa1JFDBio9QELGcl
         mELGUHk32dtWwiLNGIMYYClS89xxJdcX66eiEv2V+7GQ6n+rsJ/NP6CNiBh9JMtS+pf6
         6ZUg==
X-Gm-Message-State: AOJu0Yy1PWYrpBPNcPQKBDg3MLBYgXJD/Ne6qegkn+0x7uOFMl2Vn9q0
	WLElp6wMQa2AIUMEgMsjt+9ZDDw/rvqCDfc8vOWl2+39uKwm4eB1
X-Google-Smtp-Source: AGHT+IEI6y2M61vc6JPg0BRpBklVvF6bpXpOlq9dVXJ+TiHb3400d3Gce3CTHfGFS9OXFX65jK6iYw==
X-Received: by 2002:a17:903:2345:b0:1d9:4544:ed22 with SMTP id c5-20020a170903234500b001d94544ed22mr16209890plh.42.1707100361472;
        Sun, 04 Feb 2024 18:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUbZ7ua6zqxl1XUBgUpLr2l9MLKXoBNNGtN4+THEKc3GTz0iJ6soJruwcaDXSpfiR8R0nmb/M4wVdzJ5tRaazM7gwMY/uqbw50i8cC2YYw1i0Hh4VOQFX4tMu1IL5euTHbWY+E2SfpjTe/g1IA=
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id j21-20020a170902c3d500b001d7610fdb7csm5122855plj.226.2024.02.04.18.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 18:32:41 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id C726C36027A; Mon,  5 Feb 2024 15:32:37 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH RFC v2 0/8] m68k v4.4 backport fixes
Date: Mon,  5 Feb 2024 15:32:28 +1300
Message-Id: <20240205023236.9325-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

CIP v4.4 backport patches for m68k. Basically everything needed
to make v4.4 work on my Falcon. This includes my iounmap() fix,
Al Viro's signal handling and uaccess page fault fixes, my 030
buserr_c fix for exception handling during page faults, and Finn's
030 signal frame fix. 

Patch 1 should be applied to v4.4-cip, or else ioremap / iounmap
has no chance to work on 030 processors.

Patches 2 and 3 have been applied to v4.4-cip.

Patches 4-6 are a prerequisite for patch 8, Finn Thain's 'm68k:
Move signal frame following exception on 68020/030' patch which
had been applied but failed to compile (see error reported in
https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/
which has gone away with patches 4-6 in place).

Patch 7 is another page fault handling fix which should be applied
(though I have found no test case for it, and cannot say how common
that livelock issue is on m68k).

All patches as RFC version to give Geert and Al a chance to yell
at me in case I got details of these patches wrong. I don't claim
to understand signal handling in anywhere near the required level
of detail.

Tested on my 68030 Atari Falcon.

Cheers,

   Michael

