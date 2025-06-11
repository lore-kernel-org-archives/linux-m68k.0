Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3A5227
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600805; cv=none; b=M8gvB/COSeXTidVcAihCh/Cx+PeD11+aLKVb5GYgbPE6Jufqd7EU8IEr8olB7elnTq/jr2GrEc9I37wBQxqr8V3inG6F8FuRAIlcGRRtQeWaeAAUcbzlz9lCbo5kdsA8oHdIMPdtxJTsbh210SJ/5KBmc0WpQuhYC1UdLsci6DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600805; c=relaxed/simple;
	bh=Zr5kJXOd0E61qhqZcjK4JuesW5RctkKk1iK7a73axYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHRzjiKUi2iHpAXSmU8EB1IbJUeRkS4cPQtCNRysowhPn4nU/UnimxbNhOZIoeUObnx2r648PpmvMxG4KKwpdA+CQoksJ2Z1IBSECDqpUtA3lgBOIyj9+QmK0gdVRxM35Tc5qcutnHL23CMifDNO6uCQj+T5Nj7+y+Xk82/Rj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPQcws8z; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPQcws8z"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3139027b825so1666866a91.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 17:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600803; x=1750205603; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzGokTHWaqpctTJmaaX7l1tJgh1TuHPjKfl0NST8upg=;
        b=TPQcws8zAcQ2jSu/tvCKkyPYXwzRatRP31suwSFv9XsHwU3m6aoFteTDsnrAqNeLgj
         kHpBt1EdiaroCKNCVAb1VsVYqdaujrbB3xmd0+UK2aeUhqucsdNHZBiMM/NcUk69urwq
         nIaLxINnI8AiZpNWiC56C7Boa455iBx9UFPtG6UrTdoJrXbUnSg+uoy+waVi0YvBCnsy
         Z7lXw8rO9CnGyVLc0p11MowUSUBmG32PFh4ad45Ax9qquORycJFooTSDm1u43bn3RKRu
         DC4LkWK5pFZTO46oSLD2MsNiZT3mECPOS4HGJIQVu4WBX9IjnskSNM74Stu+MPTlpgkZ
         d1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600803; x=1750205603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzGokTHWaqpctTJmaaX7l1tJgh1TuHPjKfl0NST8upg=;
        b=TnZ7mewEJOWWvKHLnQCS1AsJ6b5QB93aUkdrW+IbFGvSZlPl/Ee4Y3Mz8j2Wh0Outy
         SKiPi81P0cmkCKgEu9CU05Ui4Zbj1PNLAMysWmzJq4IgXrFJM/bHptyqbpiVimGmz5DN
         bW/7U6yDO5PxYVy+9Fy5LHiXnk9s94rPwRszuSjA5+7S/eGQwn7gsMBV0dlXDUxam2xG
         hmwoY7aYTPRmi8FkI1yg7BQhCW08tDIGJMoH3kI12vZ8krT7rlTD2FHL2phxwrr/XwWV
         /X1H4nN/Wjn1n5HUNFYR/kuBLw3m8UOuwzmswpOvGBSG2gd30VrifVq/JRQRObFkYw9+
         WdOw==
X-Gm-Message-State: AOJu0YwCfnDldHiJ7X3pij+D0zBdbP9SoM6h4MPVPKlsavXvcaoT3kay
	0ohArb1dwBgSdk2UkSOrU54ySHRrNDcCLcRw6pMT26IvuvYUSouxFdOU
X-Gm-Gg: ASbGncs74fYT1ugbRZMGT/ChIZPCbiVkbbjhE3uNz0cPWPFKpd/k71rVXYsNCeWNQ4T
	2OP7SDY+dNo0UVXCvUcVeJFOfkwgp6u0mFNXzUR3LZuiL57f/s6t2CM1j9MkhcUfNZpRfnl2Tgs
	dWkciFfvcN5wKFMrXRBLgwfdcsdYHkV/8/bDbWG9gxnqiQl+8jF9mP1wmOfqjrnozPXN+iwWdtQ
	dQZx9S2HZk+mPyiD9z43qFwtyG/a6R3vuEHhry89YJQ131DXEkEcOtL/URoZO2ifBJ+yccr8c+Z
	0oshDcsdvWyq2S+s75ieB3mzDywmc6dSZ6Q8ZwgZBXMkJMBJ6nDd9jC5RLWGJDyFNTYA/ZuvzDH
	FLhN9uimEta6/vHJjZ6lFGNkbDiHITSs=
X-Google-Smtp-Source: AGHT+IFgEtHJxBLgI+jT81eBlMA+EU05hPKkSjYudhy5V5fcfuuIgxncTbMqid7sNNmukcqK2M9LYA==
X-Received: by 2002:a17:90b:3c11:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-313b20072e3mr846808a91.35.1749600802854;
        Tue, 10 Jun 2025 17:13:22 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:22 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 0/4] Convert motorola to use ptdescs
Date: Tue, 10 Jun 2025 17:12:51 -0700
Message-ID: <20250611001255.527952-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

m68k's Motorola still uses struct page (it's pointer tables) to track
page tables. This patchset converts it to use ptdescs, to help prepare
for allocating memory descriptors independently of struct page.

It also includes some minor cleanups to make the code more readable. 

----

Based on mm-new. This has only been compile tested, but there are
no expected runtime changes.

Vishal Moola (Oracle) (4):
  m68k: mm: Convert get_pointer_table() to use ptdescs
  m68k: mm: Convert free_pointer_table() to use ptdescs
  m68k: mm: Convert init_pointer_table() to use ptdescs
  m68k: mm: Convert pointer table macros to use ptdescs

 arch/m68k/mm/motorola.c | 54 ++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.49.0

