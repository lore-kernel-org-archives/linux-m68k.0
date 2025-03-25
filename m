Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAE2066E8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918180; cv=none; b=fBgLD5E4Lea9goqqjtHEgxZXNyxcw7HQ4XfVULtQqbD92z9qqibK5eFySb0Sa+qJB3panRas9P9BJGnEPJXzv0RZ/30X+o2O1aNxyiYi9xO+qw02kWU1/TSb64TfX/Jp+TzOOyhNZMh7Wct6j1ZT08MBGn5QBJytSnckvIv4+gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918180; c=relaxed/simple;
	bh=K6y6CroS6Xt4/WH9z9fgmP5lzXPYUcLLss85ai4Zzho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R0LSLEjsMsPeDf6Ja5By6nv9IEcMzVNejgZRIH30xjkkwEsKAi2xrUzmwivba8XLO+eCY5LK3xMqlskeOoSKryrjd7/1pCRS24wEMgAebxrzAM/jdfKlbmNCA41sqUUmCfpxVcYTDLtAy/lLRptD93KpTe3Wr9Z2yYNJQqUqjYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQl5qB4s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQl5qB4s"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4727542f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742918175; x=1743522975; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6ckCGEaHAtDt1IPzanimIwIw7z55113j5Mi11WoTOo=;
        b=nQl5qB4sOrQC7e86RBhR536M5rc5KyTwsGOhp7K5sNA9623j7w1H45kDZX1TqC1AKH
         MCWLCrdbK6GoJgCUyrxX/vm/AW9OYYaZ9+6pEkBRgYntsTeZXHPFzgzliacE0/lni1wH
         g+f5CkK+j32L6i5sI9c9OoUZccnc0c9uKP9UxWFe0PVvVLC+6SeoPLBKFkDFXajL0+1O
         bY6QXuXqICRn8aZp18WBaZBLEc/8JwydgbgUnvtV8bwM/f49CupBicS5OAP2Rm3gTMI+
         lGuY1hBV/uCNf4eXA0RgOn+cAy9ylkYl7gWoZEjiPQcpcLi5IrF1tFE6c9wuQl76qHiM
         v8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918175; x=1743522975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6ckCGEaHAtDt1IPzanimIwIw7z55113j5Mi11WoTOo=;
        b=shqRPC966SCqWDm1KhwNeos8qZ7k7P9YJp7HDizKtwWKsrGzeYzj0LwIkyObUFlwSR
         nM79dL05jhlp75NyvT8MHwX5cSw0JgpmMCIzCitxhj+WjejAz301rRfk8U24xvWNRGm+
         qiEAO9l4nMOpjseKnFmlyUC49RMtGYylFhqNdN4x+CDOIrdFmcLfA5HVdi8p0lpg44GU
         oPsXV6cTDxe+tDHutoQgZH7a/qFEEU7d/g1BHhWuIrSpzrVvJdiJ8SyeSljgIgxgZaW4
         prJsaDHs+y49s4xi+qHvEfxFCAlHtd9r+BAgu5p7MYlgSnS3+cY0GPEnQ+vOBw4//xpo
         p72Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoyU1+fA8ag9ZAWn+N23XJC2gd2BeHKJQgppRXcqEXGbFlAbFHEhuKATmxkZGFqED6WzdyTqMeM0CN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YySCPr+ViMfcuQ+UBC6nsrHeFqWpoCrtWlaLsWSe/sahG92DDE3
	1TRwCKsJm8rW/TQwISz69BUyG+Ls605O9qxHVll+R72F2t+onP8y
X-Gm-Gg: ASbGnctr/04y1L6bJI+3NQjvgRpeQnUJj7zcMDEMqtjo5ywvw4vKfLreqhCxYNSketx
	2eVZkD0he4xP3kNRKKQlDgoyV+wf+kqoZ1mYFNwjZOms78FYVhJWpbVeC2uep095RqjsYqwIo+C
	vVgm23F5f6rp6hQ4Vg+v/ZKbOwZvSAm/urZ2nu1OYtFzuB9GO6pvGDExD/S/e0XDFiTpe9LHGio
	YPCIVOiUPb5wxqrQ6MeWeY7jaLwWSWyyva5pyDaFgkbrmo3+N8cOb2ZNQiMbpOzH1rNXgY5e79H
	UOPjZWobv+v58g+NE/eHzv4o83HcsieEuF7lpeaTHC4=
X-Google-Smtp-Source: AGHT+IEijUARtkG5JnZ2jehRYwPfu3cm//HMigb61e+SvkFVAGQ0AeGru+s6k47DVYMpAfkSBnRl8Q==
X-Received: by 2002:a5d:6d82:0:b0:38d:d0ea:b04c with SMTP id ffacd0b85a97d-3997f937cc1mr16782815f8f.38.1742918174715;
        Tue, 25 Mar 2025 08:56:14 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:eead:4845:67bf:e110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9df6bsm153448925e9.31.2025.03.25.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 08:56:14 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v4 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
Date: Tue, 25 Mar 2025 16:56:11 +0100
Message-Id: <20250325155613.352680-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a driver (and the subsequent defconfig change) for the pata/CF socket in
the CS-Lab Warp series of Amiga boards.

Changes in v4:
 - refactor pata_cswarp_data_xfer()
 - ioremap WARP_OFFSET_ATA region

Changes in v3:
 - suppress a comment
 - properly return ata_host_activate() error code

Change in v2:
 - fix style, remove duplicate swap macro, driver version, etc
 - rework the zorro attach mechanism
 - remove the unnecessary zorro ids refactor

Paolo Pisati (2):
  ata: pata_cswarp: Add Amiga cslab ata support
  m68k: defconfig: enable PATA_CSWARP

 arch/m68k/configs/amiga_defconfig |   1 +
 arch/m68k/configs/multi_defconfig |   1 +
 drivers/ata/Kconfig               |  11 ++
 drivers/ata/Makefile              |   1 +
 drivers/ata/pata_cswarp.c         | 185 ++++++++++++++++++++++++++++++
 5 files changed, 199 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c

-- 
2.34.1

