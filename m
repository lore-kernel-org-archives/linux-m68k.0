Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833EA1CFA9
	for <linux-m68k@vger.kernel.org>; Mon, 30 Sep 2024 02:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727662130; cv=none; b=F9HJu37OYDSCRab3DOnra8L9IGeZFRhVAon+Y7NinMu9n+998zwj8POfqJOVcyJu4Nv66RHPTUW4GUw39s3hsuaSq6Fv3rbbDtm9+xsl5oNwdOZm5mVgbvKA03EZrytf83KiJQ7CIP62y7epS1/OvnOyfhjtCU91X379YHfvQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727662130; c=relaxed/simple;
	bh=7XG7ZdOzCscemgC5/baamNz/C4hIpJ/tm20m3r0Ngao=;
	h=From:To:Cc:Subject:Date:Message-Id; b=BgobXV9WBxPdl7vdtB7zt74Q+ht2j4D8pfcLAQMbe719xq+rNufU+FHHUMLvHwCETDz7zmbzjg0/Fmv/dXHZ2sIJudUTflSeP6U/saE/bzRr3BfD20ZHusFArzd2+nuSjX926GsiuJjOBgAJlB+71VJfvtD1WQ7q8mMikXl4UgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMXsvxWB; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMXsvxWB"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71afb729f24so2904477b3a.0
        for <linux-m68k@vger.kernel.org>; Sun, 29 Sep 2024 19:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727662128; x=1728266928; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aPYjIkgld85zkgMDdL2BMg/mkYUE9000CHOfMB0E7w=;
        b=lMXsvxWBR4SKoyfQgD6NXJZrlpWqcozbZrExSo3br0XzxNhb5j6L/jtoGagBgypgFy
         75AZT5Ou8AjOsi2bz6GwwRBuPl2wTijaUEuHjBfiLL8OIoyNlb0GaqtHmz4+itF/Yj5G
         4+Y7+mm5XK2iBIf+5bzi51xyvkYqWkF4Oq+DhY5KyHa88wzjCoRsTpbzrkDv/lrvtz2O
         wFQO1jR2+N6Oubco/ZT2Im2JKFN1fR611+eP3TDbPom4yKrsPn8Nq9qn8vVR6AOF2uOU
         gh4hkWrI5wdL7M9/7YC9dUXg7WopTf4POrIg6QBEGFqKql7QeYwZkbSPFl0BFuCPvE+Y
         v35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727662128; x=1728266928;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aPYjIkgld85zkgMDdL2BMg/mkYUE9000CHOfMB0E7w=;
        b=wiZRUJvq7f0LvqPjUr2PoaQf4MIk5O3pq7CLu1we02ZxOoNt+LaaPQky5Xlsr64a+f
         iPCHSFiOnFQBp1TTmkgLPb9TAza4y1HYFLAp2yjd9GywGYtfbpyhks7NcFYr8rkDe/lI
         BbE8rInPN0olWdO0qhKhPJkbG7rkmtU5e3aBFexdkZVEFXvmhedhkFXboQa+afMvuwcK
         B7nhtEjQMXxG87bPjvyy4JNTDWRu1aps68E9hdky6z5VIRFoSbBLUiHt2qdYhdmn1pzm
         wH9cvJK9rdiDXAGlqhXE4yyJuFVJgvgmxCfwL3Sul2CsoMovJ6cjTU0Zs0yrLV8THvQQ
         maog==
X-Forwarded-Encrypted: i=1; AJvYcCUwp3pcDq1jBshgFpsFTzg1Hic0J+fERmSkUPm0ke5hz66zxV41w9i67cflhczxK6+xifgDG45ie8+p@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPOtAjaaefP0R7pj/FdU3REKkUSgiE1cIoljhzTc9RhNHoBY7
	icTzFr2j373+e2GVk2tjY1oPCnRSgvc0SbDfp0d4n+38iROXBWZudYGATA==
X-Google-Smtp-Source: AGHT+IFGDVNKA4KCPJ0JGFD/MBXwTnDTftMxkwrbB7myOa1Q4Swo//zzlelXGVyj9qlF1nX+0UAq8Q==
X-Received: by 2002:a05:6a20:d81a:b0:1cf:122b:37d1 with SMTP id adf61e73a8af0-1d4fa6ff534mr13207200637.30.1727662127646;
        Sun, 29 Sep 2024 19:08:47 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (125-238-248-82-fibre.sparkbb.co.nz. [125.238.248.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26538728sm5173877b3a.214.2024.09.29.19.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 19:08:47 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id D3A69360366; Mon, 30 Sep 2024 15:08:42 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: uli@fpond.eu
Cc: cip-dev@lists.cip-project.org,
	linux-m68k@vger.kernel.org,
	geert@linux-m68k.org,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v4 0/2] m68k v4.4 backport fixes (resend)
Date: Mon, 30 Sep 2024 15:08:38 +1300
Message-Id: <20240930020840.15226-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Resend (partial) of my CIP v4.4 backport patches for m68k.

This series only contains patches 4 and 5 of the previous
series (Al Viro's signal handling fixes) - everything else
appears to have been applied in the meantime, or isn't
really a bugfix. These patches need merge conflict fixes
and are not suitable for cherry-picking from v4.19.y.

Tested on 60830 (Atari Falcon)

Cheers,

   Michael
 

