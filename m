Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90661836CE
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 May 2024 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000283; cv=none; b=TCMgchv0hEwC1H/TKV9GVcsq7/CJm4mFVafgZ/u2r5V8dl14j/oCDwZJHGZtlRGK58Y2Imfsa0UXarfMRPpEFso0Z5iGbo9XfSs7lGviCBFcXhmftvpbGNhFdQQwHDHzh3IqIyFqooR4do/jFbxY26QVwIkB5dS6dMhwVOPP0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000283; c=relaxed/simple;
	bh=OnUnySFw3Msyx7kKgt4sUYpbWzxrq3uFrUOZlwLZujg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=phIS9KUJ/1qND94of4QAiBiinwhPsOihdOlljoGLbaQsavX/o9BDQAkDFS/ojmgFKts++k1bqbiO/61EtxjvgsFD/WSf/Nl9K9HuOC+Zp9giMFP9iIEHPkw65LRiuny8oY0AXuxJxNY5WiBTe1QQxxJvrhGCQQjob7Svje0JUvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2zEVjKN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2zEVjKN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5786988ae9bso2861349a12.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 May 2024 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717000280; x=1717605080; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xNXM6R5bqt4nnjkmnSBt0YbhXJesxqyFYTPWwNjUvE=;
        b=G2zEVjKNRHAnJ1PlrlWCtZgAHYYHw5qFDx8E7u1B+UBnDKtUCItiYycBWqZzCNxIeP
         Y3OvaUTPOOKyyXjTKBuAdeJ5iavGS+tfnzmNQIZFMTLPFPQuM3JZF5YrJX4gporiiLE8
         qk/o5uysoNZ/HiMpP/mhMtWbT9d37yvxEdAAInMWO9a7Sjt7vJq+kvUUZA2lqKbMmaiq
         87gBoOXnME3Av3Hnok+FvA7ni/XGxjPiQv05TNeZ306TDeWQtkfAnSk37VHk0eMxLkWc
         5040M4VkJ8Ze1MMX2u97hi9q1Ort48BwYmRPT2vOYQHS319VYr90f+Vz7sCY1oaKNg9r
         y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000280; x=1717605080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xNXM6R5bqt4nnjkmnSBt0YbhXJesxqyFYTPWwNjUvE=;
        b=rbt02gclsMIV2Mrgzcsxbl2blR6TfADnRFro3sYxYbb061ecxraltsxD29AnecFsZE
         LauesTJZO3JqzYwQqr9VFpzzVd5N5ZS4Jqxx+DIaSxgkVKbkcIKoYBTMDaX10CQFyOEH
         EXz+iwnfo6L5cAsvtxrALSm+P/Kphiu7LZZOYeZnI6LaWLm862hTH20XKCK3qoOKOV3+
         6NtqqucVefRZ1BAl6v4nn3MqUCrgsLwWA0wQMkyNudCBlb+a6LggrCS99x58mLGIp9cG
         R5lu1xwz1UFYXKhMoo90TttslJEq0GbfB9egP2hhfe/uXNBlBPHEUYDrQGy4Y+dhYhep
         YxoA==
X-Gm-Message-State: AOJu0YxDxcK4TnH4qFvlZYS4Oga2Isypq9mSCd9DWcAKL7Bpf6JmRkdn
	hkWjgaNiwE5JdI4QyAg/BO5kwPqZKHHFXVNeN8mjtHn+rmuM+2DeFNu+sw==
X-Google-Smtp-Source: AGHT+IETalqX9TvHeVqTgSc/+2PFoWDFSywosCv2rZt8dbKZCkn7Sn3zu1PhzVy9aQhuwbhktgWhiA==
X-Received: by 2002:a17:907:350f:b0:a5d:107b:60be with SMTP id a640c23a62f3a-a62650116c9mr867348066b.69.1717000279568;
        Wed, 29 May 2024 09:31:19 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:3728:94ac:9c82:c663])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6335ac8944sm219109666b.4.2024.05.29.09.31.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:31:19 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: [PATCH 0/1] amiga: turn off all incoming interrupts from the Warp1260
Date: Wed, 29 May 2024 18:31:17 +0200
Message-Id: <20240529163118.867333-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS-Lab people told me where to find the interrupt ctrl register (and its
layout), so here is a patch that turn off all incoming interrupts during
config.c::amiga_parse_bootinfo().

With this patch applied, Linux finally boots on my Amiga 1200 + Warp 1260 board.

Paolo Pisati (1):
  m68k: amiga: config: upon boot, turn off all incoming interrupts from
    the Warp1260

 arch/m68k/amiga/config.c       | 9 +++++++++
 include/uapi/linux/zorro_ids.h | 3 +++
 2 files changed, 12 insertions(+)

-- 
2.34.1

