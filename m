Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568E205E38
	for <linux-m68k@vger.kernel.org>; Mon, 22 Apr 2024 02:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713752990; cv=none; b=GmlgAAt0q1UZmYwnAI7D9NehX1mttFsBqA3WiBOUHmY11KFRCrjfdOjXJG+94Jp5MzLCNM33fjflT2SD5Sp/ZTgz0dKYZ0dtATOFrGsfKkjZMa5KrjsFGAL7r5dnH9oVYfb1HDfTFQ0r2vWhg0Gk1k3BaW/Uyro2avXxVlRJEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713752990; c=relaxed/simple;
	bh=bjkyxhVlQFxLUMJ8+dHuHFNQj005aJ7HhJFKbjY3qOY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=nKmzPOMv1N3SIT80Xxmh90Af+RCuWZAu0IJMbuUVq7obOLo2paQaSTZJrkaFZy5VkKRXa8UPgbbdIyT7oJbqFWts7T8gJ8nNXdgGbZR7BkmF7NP/4kKNBHMCOZwwQgMOgF3JgaHYl4pJlH8kiQL2iDLPcoEZ8DnvxaXDs1EEW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxWWMg6K; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxWWMg6K"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso1862168b3a.1
        for <linux-m68k@vger.kernel.org>; Sun, 21 Apr 2024 19:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713752989; x=1714357789; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElMHjRkSjdFZ9OdM2VL8uKs/euHL9YH6EELgIPsbi6o=;
        b=QxWWMg6K0bJTe62RkZ+Rgw2M8E/E2EH0y/cHgKi2fDkygO59eT8d7miyyFCLCAmBPq
         Fc8yM28ngy3uGwTCnKXGQsd+tdqylvh4JZcv/GvGJFIqYkwde4xAodxu5hlHgLPCW45z
         fQ2QM29CW5MP96Y6w1AzF4SZqyJ07mPEugnlXFEYC3ML6db3CapNatFvmfbtufcf/BKo
         RrektVOleEUsHsqx/tVwDkezJjq8+i7O7k/hEvwmsx4k+oCb3l+/DwLR5kbbxKNCqw2e
         gyxy3SLeWmu6XfK4PS3Sy6h8/Gn5yUJtJUPf6IDzEmIBNyQZpt7ayum5dcrqAn2XbfV0
         XKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713752989; x=1714357789;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElMHjRkSjdFZ9OdM2VL8uKs/euHL9YH6EELgIPsbi6o=;
        b=QqYBGJ5ywK8DEIbfHwMLMmT2FkQ+sAU5WUiJIAz1mAv09kCLbOnQLNBb+P8f472uLy
         9C7WjUYof0el8KHsa8e3Zvpt3lDmWWhpsabiHZCClrjLxQZN2qBVPzW5WaUK/O2N+Gs/
         VwLIfS1LQRAjF3z4MseVfM6h3+hwY0S6l4qCVtICT2TtPj8HwuXgKdwXkazlppQaA/DT
         8MTaqGukYUmbVU3//a0eidNNUNbSgkoJmHDhEqwm2efjn2gHWHKbyYxLMazddcQ+gvJ4
         Q1I/xgFOx9RuqD2y2jNs/AIOA+VBOH4cyOzzV5xr7DWG8Ni93y6XkGWQ/JD4MLDjRIeg
         SQ+A==
X-Gm-Message-State: AOJu0YzSsysaRDOzo9MDV2C8Zjkq4e7xMffPXgK9H9SVsk1YrIpqQIXk
	/y45W/qujV5S7yaG4gSJijb2ynuRz7tt0uS/qdHZXXGo30PEA56G9iqckg==
X-Google-Smtp-Source: AGHT+IFApTEJRYj5cCogEjvNd8sUwwn7tLphh4aIstwaStZpnaPnjtG21tKqhOhwxZCuGpi5GZ8sCQ==
X-Received: by 2002:a05:6a00:812:b0:6e7:48e3:7895 with SMTP id m18-20020a056a00081200b006e748e37895mr16174734pfk.2.1713752988640;
        Sun, 21 Apr 2024 19:29:48 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id h6-20020a056a00170600b006e6b180d87asm6762107pfc.35.2024.04.21.19.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 19:29:48 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id A8E6036027A; Mon, 22 Apr 2024 14:29:44 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com
Subject: [PATCH RFC v2 0/2] m68k uaccess fault handling fixes
Date: Mon, 22 Apr 2024 14:29:41 +1200
Message-Id: <20240422022943.13775-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Version 2 of fixes for uaccess fault handling on 68030 -
these patches ought to work on 68040 just as well.

Patch 1 is a reworked version of my earlier RFC patch, extending
the exception table in __generic_copy_to_user by an additional
instruction past each moves instruction instead of using NOPs
to force the fault on that instruction.

Patch 2 corrects a similar problem in __constant_copy_to_user_asm
by using a combination of additional exception table entries
and a NOP placed after the final moves instruction. 

I have found only the 8 and 12 byte cases of this inline
code in use in the kernel, and have been able to test the 
8 byte case only (llseek). The 12 byte case (netdev ioctl)
may be impossible to exercise on m68k.

Testing on 040 and 060, as well as Coldfire, would be great.

Cheers,

   Michael


